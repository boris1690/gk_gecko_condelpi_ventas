import 'package:app/screens/Option/model/option_request_model.dart';
import 'package:app/screens/Option/service/option_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OptionController extends GetxController {
  late final OptionService _optionService;

  @override
  void onInit() {
    super.onInit();
    _optionService = Get.put(OptionService());
  }

  Future<dynamic> getOptions(Map data) async {
    final response =
        await _optionService.fetchOption(OptionRequestModel(data: data));

    if (response != null) {
      /// Set isLogin to true
      return response;
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
