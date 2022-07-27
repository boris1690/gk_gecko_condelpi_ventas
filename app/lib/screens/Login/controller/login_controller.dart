import 'package:app/core/authentication/authentication_manager.dart';
import 'package:app/core/authentication/cache_manager.dart';
import 'package:app/screens/Login/model/login_request_model.dart';
import 'package:app/screens/Login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.find();
  }

  Future<void> loginUser(String username, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(username: username, password: password));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Credenciales no válidas',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
