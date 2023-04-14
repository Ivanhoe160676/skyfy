import 'package:firebase_auth/firebase_auth.dart';
import 'package:skyfy/src/domain/responses/reset_password_response.dart';
import 'package:skyfy/src/domain/responses/sign_in_response.dart';

abstract class AuthRepository {
  Future<User?> get user;
  Future<bool> get isAppleSignInAvailable;

  Future<void> signOut();
  Future<SignInResponse> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<SignInResponse> signInWithGoogle();
  Future<SignInResponse> signInWithApple();
  Future<ResetPasswordResponse> sendResetPasswordLink(String email);
}
