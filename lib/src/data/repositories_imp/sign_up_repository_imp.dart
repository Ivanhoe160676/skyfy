import 'package:firebase_auth/firebase_auth.dart';

import 'package:skyfy/src/domain/repositories/sign_up_repository.dart';
import 'package:skyfy/src/domain/responses/sign_up_response.dart';
import 'package:skyfy/src/ui/utils/inputs/sign_up.dart';

class SignUpRepositoryImp implements SignUpRepository {
  final FirebaseAuth _auth;
  SignUpRepositoryImp(this._auth);

  @override
  Future<SignUpResponse> register(SignUpData data) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      await userCredential.user!.updateDisplayName(
        "${data.name} ${data.lastname}",
      );
      return SignUpResponse(null, userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse(
        parseStringToSignUpError(e.code),
        null,
      );
    }
  }
}
