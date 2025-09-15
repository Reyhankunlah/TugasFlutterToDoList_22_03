import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Controllers/auth_controller.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/components/custom_button.dart';
import 'package:flutter_todolist/components/custom_text.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final cLogPage = Get.find<AuthController>();
  final taskC = Get.put(TaskController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // biar aman saat keyboard muncul
      body: SafeArea(
        child: Stack(
          children: [
            // ===== Background bulet-bulet =====
            Positioned(
              top: -100,
              right: -100,
              child: _circleBg(250, CustomColor.whiteShadows),
            ),
            Positioned(
              bottom: -120,
              left: -100,
              child: _circleBg(280, CustomColor.whiteShadows),
            ),

            // ===== Main content =====
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // gantinya Spacer
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ===== Header =====
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/tulist_logo.png", height: 70),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: CustomText(
                          myText: 'Login here',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontColor: CustomColor.bluePrimary,
                        ),
                      ),
                    ],
                  ),

                  // ===== Form login =====
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: CustomTextField(
                          label: "Username",
                          controller: cLogPage.input1,
                          isNumber: false,
                          borderColor: CustomColor.bluePrimary,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        child: CustomTextField(
                          label: "Password",
                          controller: cLogPage.input2,
                          isPassword: true,
                          isNumber: false,
                          borderColor: CustomColor.bluePrimary,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: CustomText(
                            myText: 'Forgot your password?',
                            fontColor: CustomColor.blueSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // ===== Tombol Login & Create account =====
                  Column(
                    children: [
                      Obx(() {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: CustomButton(
                            myText: cLogPage.isLoading.value
                                ? "Processing..."
                                : "LOGIN",
                            textColor: CustomColor.black,
                            onPressed: cLogPage.loginLogic,
                            isOutlined: true,
                          ),
                        );
                      }),
                      InkWell(
                        onTap: () {},
                        child: const CustomText(
                          myText: 'Create new account',
                          fontColor: CustomColor.elementInactive1,
                        ),
                      ),
                    ],
                  ),

                  // ===== Continue with =====
                  Column(
                    children: [
                      const CustomText(
                        fontColor: CustomColor.elementInactive2,
                        myText: 'Or continue with',
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialButton("assets/google_icon.png"),
                            _socialButton("assets/facebook_icon.png"),
                            _socialButton("assets/apple_icon.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(asset, width: 28, height: 28),
      ),
    );
  }

  Widget _circleBg(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
