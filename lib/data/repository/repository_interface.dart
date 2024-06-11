import 'package:dynamic_architechture/presentation/LoginScreen/login_model.dart';

typedef M<T> = Future<T>;

abstract class RepositoryInterface {
  Future<List<dynamic>> returnData();

  M login(String userName, String password);

  Future<dynamic> register(String userName, String email, String password);

  Future<dynamic> updateProfile(String firstName, String lastName);
}
