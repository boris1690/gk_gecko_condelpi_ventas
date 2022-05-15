import 'dart:convert';
import 'dart:developer';

import 'package:app/screens/Login/model/login_request_model.dart';
import 'package:app/screens/Login/model/login_response_model.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class LoginService extends GetConnect {
  final String loginUrl = 'http://127.0.0.1:8000/api/v2/login';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok &&
        response.body['status'] == 'ok') {
      return LoginResponseModel.fromJson(response.body['data']);
    } else {
      return null;
    }
  }
}
