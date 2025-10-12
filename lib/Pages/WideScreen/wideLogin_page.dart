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
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600; 

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            // Background lingkaran
            Positioned(
              top: -100,
              right: -100,
              child: const CircleBg(size: 250, color: CustomColor.whiteShadows),
            ),
            Positioned(
              bottom: -120,
              left: -100,
              child: const CircleBg(size: 280, color: CustomColor.whiteShadows),
            ),

            // Konten utama
            Center(
              child: Container(
                width: isTablet ? size.width * 0.6 : size.width, // tengah untuk tablet
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 48 : 24,
                  vertical: isTablet ? 32 : 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo dan judul
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/tulist_logo.png", height: isTablet ? 100 : 70),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: CustomText(
                            myText: 'Login here',
                            fontSize: isTablet ? 26 : 20,
                            fontWeight: FontWeight.bold,
                            fontColor: CustomColor.bluePrimary,
                          ),
                        ),
                      ],
                    ),

                    // Input fields
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          label: "Username",
                          controller: cLogPage.inpUsername,
                          isNumber: false,
                          borderColor: CustomColor.bluePrimary,
                        ),
                        const SizedBox(height: 14),
                        CustomTextField(
                          label: "Password",
                          controller: cLogPage.inpPassword,
                          isPassword: true,
                          isNumber: false,
                          borderColor: CustomColor.bluePrimary,
                        ),
                        const SizedBox(height: 8),
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
                        const SizedBox(height: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}
