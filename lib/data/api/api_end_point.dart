class ApiEndPoint {
  static String get _baseUrl => "https://dummyjson.com";
  static String get loginUrl => "$_baseUrl/auth/login";
}

// customSnackBar({required String title, Color? backGroundColor, Color? textColor}) {
//   ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
//     content: Text(
//       title,
//       style: TextStyle(color: textColor ?? Colors.white),
//     ),
//     backgroundColor: backGroundColor ?? Colors.grey,
//   ));
// }
