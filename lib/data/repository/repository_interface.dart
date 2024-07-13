import 'package:dynamic_architechture/data/api/http_manager.dart';

abstract class RepositoryInterface {
  E login(String userName, String password);
}
