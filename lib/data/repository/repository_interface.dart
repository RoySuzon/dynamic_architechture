
import 'package:dynamic_architechture/presentation/LoginScreen/login_model.dart';

abstract class RepositoryInterface {


  Future<List<dynamic>> returnData();

  Future<LoginResponse> login(String userName, String password);

  Future<dynamic> register(String userName, String email, String password);

  Future<dynamic> updateProfile(String firstName, String lastName);
}
