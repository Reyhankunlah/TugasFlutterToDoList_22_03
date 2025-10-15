import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/backDecoration.dart';
import 'package:flutter_todolist/Components/custom_color.dart';
import 'package:flutter_todolist/Components/custom_textfield.dart';
import 'package:flutter_todolist/Controllers/auth_controller.dart';
import 'package:flutter_todolist/components/custom_button.dart';
import 'package:flutter_todolist/components/custom_text.dart';
import 'package:flutter_todolist/components/social_button.dart';
import 'package:get/get.dart';

class WideloginPage extends StatelessWidget {
  WideloginPage({super.key});

  final cLogPage = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: SafeArea(
        child: Stack(
          children: [
            BackDecoration(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(right: 1),
                        child: Image.asset(
                          "assets/login_anim.gif",
                          height: 200,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 1),

                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(left: 40),
                        constraints: const BoxConstraints(maxWidth: 420),
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
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 25,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  myText: "Welcome Back!",
                                  fontColor: CustomColor.bluePrimary,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: CustomTextField(
                                  label: "Username",
                                  controller: cLogPage.inpUsername,
                                  isNumber: false,
                                  borderColor: CustomColor.bluePrimary,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: CustomTextField(
                                  label: "Password",
                                  controller: cLogPage.inpPassword,
                                  isPassword: true,
                                  isNumber: false,
                                  borderColor: CustomColor.bluePrimary,
                                ),
                              ),

                              Container(
                                alignment: Alignment.centerRight,
                                margin: const EdgeInsets.only(top: 6),
                                child: InkWell(
                                  onTap: () {},
                                  child: CustomText(
                                    myText: 'Forgot your password?',
                                    fontColor: CustomColor.blueSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(top: 18),
                                child: Obx(() {
                                  return CustomButton(
                                    myText: cLogPage.isLoading.value
                                        ? "Processing..."
                                        : "LOGIN",
                                    textColor: CustomColor.black,
                                    onPressed: cLogPage.loginLogic,
                                    isOutlined: true,
                                  );
                                }),
                              ),

                              Container(
                                margin: const EdgeInsets.only(top: 14),
                                child: Column(
                                  children: [
                                    const CustomText(
                                      fontColor: CustomColor.elementInactive2,
                                      myText: 'Or continue with',
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                    ),
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  }
}
