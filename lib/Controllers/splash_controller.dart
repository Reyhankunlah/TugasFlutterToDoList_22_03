import 'package:flutter_todolist/Routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    checkLogin();
    super.onInit();
  }

  checkLogin() async {
    await Future.delayed(Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("username") != null) {
      Get.offAllNamed(AppRoutes.mainNavPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
