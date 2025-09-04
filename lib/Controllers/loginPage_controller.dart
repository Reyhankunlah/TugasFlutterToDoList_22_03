import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_todolist/Routes/routes.dart';

class LoginpageController extends GetxController {
  final String username = "faiz";
  final String password = "tinus";
  final String dummy = "asd";

  final input1 = TextEditingController(); // username
  final input2 = TextEditingController(); // password

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
    // simulasi loading singkat (opsional)
    await Future.delayed(Duration(milliseconds: 300));
    isLoading.value = false;

    // pindah halaman
    Get.toNamed(AppRoutes.dashboardPage);
  }

  @override
  void onClose() {
    input1.dispose();
    input2.dispose();
    super.onClose();
  }
}
