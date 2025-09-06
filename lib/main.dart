import 'package:flutter/material.dart';
import 'package:flutter_todolist/Bindings/appBinding.dart';
import 'package:flutter_todolist/Routes/pages.dart';
import 'package:flutter_todolist/Routes/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialBinding: Appbinding(),
      initialRoute: AppRoutes.loginPage,
      getPages: AppPages.pages,
    );
  }
}
