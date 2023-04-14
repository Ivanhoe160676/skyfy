import 'package:skyfy/src/domain/repositories/auth_repository.dart';
import 'package:skyfy/src/ui/global/controllers/session_controller.dart';

import 'package:skyfy/src/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  final SessionController _sessionController;
  final AuthRepository _authRepository = Get.find();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._sessionController) {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    if (user != null) {
      _routeName = Routes.skyfybnb;
      _sessionController.setUser(user);
    } else {
      _routeName = Routes.login;
    }
    notify();
  }
}
