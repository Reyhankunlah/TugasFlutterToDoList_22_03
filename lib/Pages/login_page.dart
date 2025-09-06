import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
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
            SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),

                  // ===== Header =====
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/tulist_logo.png", height: 70),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomText(
                        myText: 'Login here',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontColor: CustomColor.bluePrimary,
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // ===== Username =====
                  CustomInput(
                    label: "Username",
                    controller: cLogPage.input1,
                    isNumber: false,
                    borderColor: CustomColor.bluePrimary,
                  ),
                  const SizedBox(height: 16),

                  // ===== Password =====
                  CustomInput(
                    label: "Password",
                    controller: cLogPage.input2,
                    isPassword: true,
                    isNumber: false,
                    borderColor: CustomColor.bluePrimary,
                  ),

                  const SizedBox(height: 12),

                  // ===== Forgot password =====
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                          color: CustomColor.blueSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ===== Button Login =====
                  Obx(() {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        myText: cLogPage.isLoading.value
                            ? "Processing..."
                            : "LOGIN",
                        myTextColor: Colors.white,
                        onPressed: cLogPage.loginLogic,
                        isOutlined: true,
                      ),
                    );
                  }),

                  const SizedBox(height: 16),

                  // ===== Create account =====
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: const CustomText(
                        myText: 'Create new account',
                        fontColor: CustomColor.elementInactive1,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ===== Continue with =====
                  const Center(
                    child: CustomText(
                      fontColor: CustomColor.elementInactive2,
                      myText: 'Or continue with',
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton("assets/google_icon.png"),
                      const SizedBox(width: 16),
                      _socialButton("assets/facebook_icon.png"),
                      const SizedBox(width: 16),
                      _socialButton("assets/apple_icon.png"),
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
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(asset, width: 28, height: 28),
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
