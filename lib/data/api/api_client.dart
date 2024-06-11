import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

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
      throw Exception('Error in getData => ${response.statusCode}');
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
     
      var responseJson = _processResponse(response);
      return responseJson;
    } catch (e) {
      if (kDebugMode) {
        print("Error in postData: $e");
      }
      throw e;
    }
  }
}

customSnackBar({required String title, Color? backGroundColor, Color? textColor}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
    content: Text(
      title,
      style: TextStyle(color: textColor ?? Colors.white),
    ),
    backgroundColor: backGroundColor ?? Colors.grey,
  ));
}

Future _processResponse(http.Response response) async {
  switch (response.statusCode) {
    case 200:
      customSnackBar(title: "Sucess");

      var resJson = response.body;
      return resJson;
    case 400:
      customSnackBar(title: "Error");
      throw BadRequestException(
          response.body, response.request?.url.toString());
    case 401:
      customSnackBar(title: "Error");
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['code'];
      throw UnauthorizedException(
          errorMessage, response.request?.url.toString());
    case 403:
      customSnackBar(title: "Erro");
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['code'];
      throw UnauthorizedException(
          errorMessage, response.request?.url.toString());
    case 404:
      customSnackBar(title: "Error");
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['code'];
      throw DataNotFoundException(
          errorMessage, response.request?.url.toString());
    case 500:
    default:
      throw FetchDataException(
          "Error occurred with code: ${response.statusCode}",
          response.request?.url.toString());
  }
}
