import 'package:skyfy/src/domain/responses/sign_up_response.dart';
import 'package:skyfy/src/ui/utils/inputs/sign_up.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> register(SignUpData data);
}
