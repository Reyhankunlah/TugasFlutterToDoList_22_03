import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Controllers/auth_controller.dart';
import 'package:flutter_todolist/Controllers/task_controller.dart';
import 'package:flutter_todolist/components/custom_button.dart';
import 'package:flutter_todolist/components/custom_text.dart';
import 'package:flutter_todolist/components/social_button.dart';
import 'package:flutter_todolist/components/circle_bg.dart';
import 'package:get/get.dart';

class WideloginPage extends StatelessWidget {
  WideloginPage({super.key});

  final cLogPage = Get.find<AuthController>();
  final taskC = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  child: Center(
                    child: Image.asset("assets/tulist_logo.png", height: 70),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 90),
                    constraints: const BoxConstraints(maxHeight: 385),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 12,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Input fields
                          CustomTextField(
                            label: "Username",
                            controller: cLogPage.inpUsername,
                            isNumber: false,
                            borderColor: CustomColor.bluePrimary,
                          ),
                          CustomTextField(
                            label: "Password",
                            controller: cLogPage.inpPassword,
                            isPassword: true,
                            isNumber: false,
                            borderColor: CustomColor.bluePrimary,
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

                          // Tombol Login
                          Obx(() {
                            return CustomButton(
                              myText: cLogPage.isLoading.value
                                  ? "Processing..."
                                  : "LOGIN",
                              textColor: CustomColor.black,
                              onPressed: cLogPage.loginLogic,
                              isOutlined: true,
                            );
                          }),

                          Container(
                            child: Column(
                              children: [
                                Center(
                                  child: const CustomText(
                                    fontColor: CustomColor.elementInactive2,
                                    myText: 'Or continue with',
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SocialButton(
                                      asset: "assets/google_icon.png",
                                    ),
                                    SocialButton(
                                      asset: "assets/facebook_icon.png",
                                    ),
                                    SocialButton(
                                      asset: "assets/apple_icon.png",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
