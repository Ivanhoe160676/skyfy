import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:skyfy/src/data/providers/apple_sign_in.dart';
import 'package:skyfy/src/domain/repositories/auth_repository.dart';
import 'package:skyfy/src/domain/responses/reset_password_response.dart';
import 'package:skyfy/src/domain/responses/sign_in_response.dart';

class AuthRepositoryImp implements AuthRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final AppleSignIn _appleSignIn;
  User? _user;

  final Completer<void> _completer = Completer();

  AuthRepositoryImp({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required AppleSignIn appleSignIn,
  })  : _auth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _appleSignIn = appleSignIn {
    _init();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }

  void _init() async {
    _auth.authStateChanges().listen(
      (User? user) {
        if (!_completer.isCompleted) {
          _completer.complete();
        }
        _user = user;
      },
    );
  }

  @override
  Future<void> signOut() async {
    final data = _user?.providerData ?? [];
    String providerId = 'firebase';
    for (final provider in data) {
      // password
      // phone
      // google.com
      // facebook.com
      // twitter.com
      // github.com
      // apple.com
      if (provider.providerId != 'firebase') {
        providerId = provider.providerId;
        break;
      }
    }

    if (providerId == 'google.com') {
      await _googleSignIn.signOut();
    }
    return _auth.signOut();
  }

  @override
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _checkAuthProvider(
        email: email,
        signInMethod: 'password',
      );
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user!;
      return SignInResponse.getSuccessResponse(
        user,
        userCredential.credential?.providerId,
      );
    } on FirebaseAuthException catch (e) {
      return getSignInError(e);
    }
  }

  @override
  Future<ResetPasswordResponse> sendResetPasswordLink(String email) async {
    try {
      await _checkAuthProvider(email: email, signInMethod: 'password');
      await _auth.sendPasswordResetEmail(email: email);
      return ResetPasswordResponse.ok;
    } on FirebaseAuthException catch (e) {
      return stringToResetPasswordResponse(e.code);
    }
  }

  @override
  Future<SignInResponse> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        return SignInResponse.getCancelledError();
      }

      await _checkAuthProvider(
        email: account.email,
        signInMethod: 'google.com',
      );

      final googleAuth = await account.authentication;

      final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      return _signInWithCredential(oAuthCredential);
    } on FirebaseAuthException catch (e) {
      return getSignInError(e);
    }
  }

  Future<SignInResponse> _signInWithCredential(
      AuthCredential oAuthCredential) async {
    try {
      final userCredential = await _auth.signInWithCredential(
        oAuthCredential,
      );
      final user = userCredential.user!;
      if (!user.emailVerified && user.email != null) {
        await user.sendEmailVerification();
      }
      return SignInResponse.getSuccessResponse(
        user,
        userCredential.credential?.providerId,
      );
    } on FirebaseAuthException catch (e) {
      return getSignInError(e);
    }
  }

  ///
  Future<void> _checkAuthProvider({
    required String email,
    required String signInMethod,
  }) async {
    final methods = await _auth.fetchSignInMethodsForEmail(email);
    if (methods.isNotEmpty && !methods.contains(signInMethod)) {
      if (signInMethod == 'google.com') {
        await _googleSignIn.signOut();
      }
      throw FirebaseAuthException(
        code: "account-exists-with-different-credential",
        credential: AuthCredential(
          providerId: methods.first,
          signInMethod: signInMethod,
        ),
      );
    }
  }

  ///
  @override
  Future<SignInResponse> signInWithApple() async {
    try {
      final appleResponse = await _appleSignIn.signIn();
      final identityToken = appleResponse.credential.identityToken;

      if (identityToken != null) {
        final data = JwtDecoder.decode(identityToken);

        final email = data['email'] as String?;
        if (email != null) {
          await _checkAuthProvider(
            email: email,
            signInMethod: 'apple.com',
          );
        }
      }

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oAuthCredential = OAuthProvider("apple.com").credential(
        idToken: identityToken,
        rawNonce: appleResponse.rawNonce,
      );

      return _signInWithCredential(oAuthCredential);
    } on SignInWithAppleAuthorizationException {
      return SignInResponse.getCancelledError();
    } on FirebaseAuthException catch (e) {
      return getSignInError(e);
    } catch (e) {
      return SignInResponse.getUnknownError();
    }
  }

  @override
  Future<bool> get isAppleSignInAvailable => _appleSignIn.isAvailable;
}
