import 'package:flutter_todolist/Bindings/TaskBinding.dart';
import 'package:flutter_todolist/Bindings/authBinding.dart';
import 'package:flutter_todolist/Bindings/editTodoBinding.dart';
import 'package:flutter_todolist/Bindings/mainNavBinding.dart';
import 'package:flutter_todolist/Bindings/responsiveBinding.dart';
import 'package:flutter_todolist/Bindings/splashBinding.dart';
import 'package:flutter_todolist/Controllers/auth_controller.dart';
import 'package:flutter_todolist/Pages/MobileScreen/editTodo_page.dart';
import 'package:flutter_todolist/Pages/MobileScreen/login_page.dart';
import 'package:flutter_todolist/Pages/Transform/home_transform.dart';
import 'package:flutter_todolist/Pages/Transform/login_transform.dart';
import 'package:flutter_todolist/Pages/Transform/nav_transform.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideHome_page.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideLogin_page.dart';
import 'package:flutter_todolist/Pages/nav/mainNav_page.dart';
import 'package:flutter_todolist/Pages/MobileScreen/splash_page.dart';
import 'package:flutter_todolist/Pages/MobileScreen/toDo_page.dart';
import 'package:flutter_todolist/Pages/nav/sideNav_page.dart';
import 'package:flutter_todolist/Routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: Authbinding(),
    ),
    GetPage(
      name: AppRoutes.toDoPage,
      page: () => ToDoPage(),
      binding: Taskbinding(),
    ),
    GetPage(
      name: AppRoutes.editToDoPage,
      page: () => EditTodoPage(),
      binding: Edittodobinding(),
    ),
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashPage(),
      binding: Splashbinding(),
    ),
    GetPage(
      name: AppRoutes.mainNav,
      page: () => MainnavPage(),
      binding: Mainnavbinding(),
    ),
    GetPage(
      name: AppRoutes.navTransform,
      page: () => NavTransform(),
      bindings: [Responsivebinding(), Mainnavbinding()],
    ),
    GetPage(
      name: AppRoutes.wideHomePage,
      page: () => WidehomePage(),
      binding: Taskbinding(),
    ),
    GetPage(
      name: AppRoutes.wideLoginPage,
      page: () => WideloginPage(),
      binding: Authbinding(),
    ),
    GetPage(
      name: AppRoutes.loginTransform,
      page: () => LoginTransform(),
      bindings: [Responsivebinding(), Authbinding()],
    ),
    GetPage(
      name: AppRoutes.homeTransform,
      page: () => HomeTransform(),
      bindings: [Responsivebinding(), Taskbinding()],
    ),
  ];
}
