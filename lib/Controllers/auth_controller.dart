import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_todolist/Routes/routes.dart';

class AuthController extends GetxController {
  final String username = "faiz";
  final String password = "tinus";
  final String dummy = "asd";

  final input1 = TextEditingController(); 
  final input2 = TextEditingController();

  final isLoading = false.obs;

  void loginLogic() async {
    final u = input1.text.trim();
    final p = input2.text.trim();

    final ok = (u == username && p == password) || (u == dummy && p == dummy);

    if (!ok) {
      Get.snackbar("Login Gagal", "Username atau password salah");
      return;
    }

    isLoading.value = true;
   
    await Future.delayed(Duration(milliseconds: 300));
    isLoading.value = false;

    
    Get.offNamed(AppRoutes.mainNavPage);
  }

  @override
  void onClose() {
    input1.dispose();
    input2.dispose();
    super.onClose();
  }
}
