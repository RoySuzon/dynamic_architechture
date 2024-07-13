import 'dart:io';
import 'package:dynamic_architechture/data/api/api_end_point.dart';
import 'package:dynamic_architechture/data/api/http_manager.dart';
import 'repository_interface.dart';

class RepositoryData implements RepositoryInterface {
  @override
  E login(String userName, String password) async {
    return HttpManager.apiRequest(url: ApiEndPoint.loginUrl, method: Method.post, statusCode: HttpStatus.ok, body: {"username": userName, "password": password});
  }
}
