import 'package:flutter/material.dart';
import 'package:flutter_todolist/Controllers/loginPage_controller.dart';
import 'package:flutter_todolist/components/custom_button.dart';
import 'package:flutter_todolist/components/custom_input.dart';
import 'package:flutter_todolist/components/custom_text.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final cLogPage = Get.find<LoginpageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomText(
              myText: "Please fill username and password below",
              myTextColor: Colors.blueAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              align: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Username
            CustomInput(
              label: "Username",
              controller: cLogPage.input1,
              isNumber: false,
            ),
            const SizedBox(height: 16),

            // Password
            CustomInput(
              label: "Password",
              controller: cLogPage.input2,
              isPassword: true,
              isNumber: false,
            ),
            const SizedBox(height: 24),

            // Button
            Obx(() {
              return SizedBox(
                width: double.infinity,
                child: CustomButton(
                  myText: cLogPage.isLoading.value ? "Processing..." : "LOGIN",
                  myTextColor: const Color.fromARGB(255, 64, 69, 215),
                  onPressed: cLogPage.loginLogic,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
