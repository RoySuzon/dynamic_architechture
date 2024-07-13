import 'package:dynamic_architechture/data/models/producst_model.dart';
import 'package:dynamic_architechture/data/models/user_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CommonFucunctions {
  static Rxn<User> user = Rxn();
  static RxList<Products> products = RxList();
}
