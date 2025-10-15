import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Controllers/auth_controller.dart';
import 'package:flutter_todolist/components/custom_button.dart';
import 'package:flutter_todolist/components/custom_text.dart';
import 'package:flutter_todolist/components/social_button.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final cLogPage = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteShadows,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            BackDecoration(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/tulist_logo.png",
                          height: 70,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: CustomText(
                          myText: 'Welcome Back!',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontColor: CustomColor.bluePrimary,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        label: "Username",
                        controller: cLogPage.inpUsername,
                        isNumber: false,
                        borderColor: CustomColor.bluePrimary,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        label: "Password",
                        controller: cLogPage.inpPassword,
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

                  Column(
                    children: [
                      const CustomText(
                        fontColor: CustomColor.elementInactive2,
                        myText: 'Or continue with',
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SocialButton(asset: "assets/google_icon.png"),
                          SocialButton(asset: "assets/facebook_icon.png"),
                          SocialButton(asset: "assets/apple_icon.png"),
                        ],
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
}
