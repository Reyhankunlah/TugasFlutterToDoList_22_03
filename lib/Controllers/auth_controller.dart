import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_todolist/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final String username = "faiz";
  final String password = "tinus";
  final String dummy = "asd";

  final inpUsername = TextEditingController();
  final inpPassword = TextEditingController();

  final isLoading = false.obs;

  void loginLogic() async {
    final user = inpUsername.text.trim();
    final pass = inpPassword.text.trim();

    final ok =
        (user == username && pass == password) ||
        (user == dummy && pass == dummy);

    if (!ok) {
      Get.snackbar("Error", "Invalid Username / Password");
    } else {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", inpUsername.text.toString());
      isLoading.value = true;

      await Future.delayed(Duration(milliseconds: 300));
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.navTransform);
      return;
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');

    Get.offAllNamed(AppRoutes.splashPage);
  }

  @override
  void onClose() {
    inpUsername.dispose();
    inpPassword.dispose();
    super.onClose();
  }
}
