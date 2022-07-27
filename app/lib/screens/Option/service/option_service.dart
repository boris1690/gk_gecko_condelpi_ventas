import 'dart:convert';
import 'dart:developer';
import 'package:app/constants/constants.dart' as constants;
import 'package:app/screens/Option/model/option_request_model.dart';
import 'package:app/screens/Option/model/option_response_model.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class OptionService extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultContentType = "multipart/form-data";
    httpClient.timeout = Duration(seconds: 20);

    super.onInit();
  }

  final String url = "${constants.Env.baseUrl}v1/products";
  /* final String url = "https://app.condelpi.com/api/v1/products"; */

  Future<List<OptionResponseModel>?> fetchOption(
      OptionRequestModel model) async {
    final response = await get("${url}?${model.toUriParameters()}");

    if (response.statusCode == HttpStatus.ok &&
        response.body['status'] == 'ok') {
      return (response.body['data'] as List<dynamic>)
          .map(
              (e) => OptionResponseModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } else {
      return null;
    }
  }
}
