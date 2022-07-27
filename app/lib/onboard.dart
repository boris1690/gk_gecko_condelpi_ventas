import 'package:app/core/authentication/authentication_manager.dart';
import 'package:app/screens/Home/index.dart';
import 'package:app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? Home() : Login();
    });
  }
}
