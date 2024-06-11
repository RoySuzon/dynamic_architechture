import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

import '/core/utils/prefs_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/core/errors/app_exception.dart';

class ApiClient {
  String? get baseUrl => "https://dummyjson.com";

  Future<dynamic> getData(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Authorization': 'Bearer ' '}',
      },
    );
    if (response.statusCode == 200) {
      String responseBody = response.body;
      return responseBody;
    } else {
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
      return;
    }
  }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data,
      {bool useBearerToken = true}) async {
    try {
      final headers = <String, String>{
        'Content-Type': 'application/json', // Add Content-Type header
      };
      if (useBearerToken) {
        headers['Authorization'] = 'Bearer ${PrefUtils().getAuthToken()}';
      }
      http.Response response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers.cast<String, String>(),
        body: json.encode(data),
      );
      return await _processResponse(response);
    } catch (e, s) {
      if (kDebugMode) {
        print("Error in postData: $s");
      }
      return;
    }
  }
}

_processResponse(http.Response response) async {
  switch (response.statusCode) {
    case 200:
      // const SnackBar(content: Text('Succes'), backgroundColor: Colors.green);
      Get.snackbar('Login', "Succes", backgroundColor: Colors.green);
      final resJson = response.body;
      return resJson;
    case 400:
      Get.snackbar('Error', "${response.statusCode} Error",
          backgroundColor: Colors.red, colorText: Colors.white);
      throw BadRequestException(
          response.body, response.request?.url.toString());
    case 401:
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['code'];
      Get.snackbar('Error', "${response.body} Error",
          backgroundColor: Colors.red, colorText: Colors.white);
      throw UnauthorizedException(
          errorMessage, response.request?.url.toString());
    case 403:
      Get.snackbar('Error', "${response.statusCode} Error",
          backgroundColor: Colors.red, colorText: Colors.white);
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['code'];
      throw UnauthorizedException(
          errorMessage, response.request?.url.toString());
    case 404:
      Get.snackbar('Error', "${response.statusCode} Error",
          backgroundColor: Colors.red, colorText: Colors.white);
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['code'];
      throw DataNotFoundException(
          errorMessage, response.request?.url.toString());
    // case 500:
    default:
      Get.snackbar('Error', "${response.statusCode} Error",
          backgroundColor: Colors.red, colorText: Colors.white);
      throw FetchDataException(
          "Error occurred with code: ${response.statusCode}",
          response.request?.url.toString());
  }
}
