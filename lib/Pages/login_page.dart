import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Controllers/loginPage_controller.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/components/custom_button.dart';
import 'package:flutter_todolist/components/custom_text.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final cLogPage = Get.find<LoginpageController>();
  final taskC = Get.find<TaskController>();

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

            // ===== Main content scrollable =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 48,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // ===== Header =====
                        Column(
                          children: [
                            Center(
                              child: Image.asset("assets/tulist_logo.png",
                                  height: 70),
                            ),
                            const SizedBox(height: 10),
                            CustomText(
                              myText: 'Login here',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontColor: CustomColor.bluePrimary,
                            ),
                          ],
                        ),

                        // ===== Form login =====
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextField(
                              label: "Username",
                              controller: cLogPage.input1,
                              isNumber: false,
                              borderColor: CustomColor.bluePrimary,
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              label: "Password",
                              controller: cLogPage.input2,
                              isPassword: true,
                              isNumber: false,
                              borderColor: CustomColor.bluePrimary,
                            ),
                            const SizedBox(height: 6),
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
                                margin: const EdgeInsets.only(bottom: 12),
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
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _socialButton("assets/google_icon.png"),
                                _socialButton("assets/facebook_icon.png"),
                                _socialButton("assets/apple_icon.png"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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