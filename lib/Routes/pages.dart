import 'package:flutter_todolist/Bindings/TaskBinding.dart';
import 'package:flutter_todolist/Bindings/authBinding.dart';
import 'package:flutter_todolist/Bindings/editTodoBinding.dart';
import 'package:flutter_todolist/Bindings/mainNavBinding.dart';
import 'package:flutter_todolist/Bindings/responsiveBinding.dart';
import 'package:flutter_todolist/Bindings/splashBinding.dart';
import 'package:flutter_todolist/Pages/MobileScreen/editTodo_page.dart';
import 'package:flutter_todolist/Pages/MobileScreen/login_page.dart';
import 'package:flutter_todolist/Pages/MobileScreen/profile_page.dart';
import 'package:flutter_todolist/Pages/MobileScreen/splash_page.dart';
import 'package:flutter_todolist/Pages/MobileScreen/toDo_page.dart';
import 'package:flutter_todolist/Pages/Transform/editTodo_transform.dart';
import 'package:flutter_todolist/Pages/Transform/history_transform.dart';
import 'package:flutter_todolist/Pages/Transform/profile_transform.dart';
import 'package:flutter_todolist/Pages/Transform/todo_transform.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideEditTodo_page.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideHome_page.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideLogin_page.dart';
import 'package:flutter_todolist/Pages/Transform/home_transform.dart';
import 'package:flutter_todolist/Pages/Transform/login_transform.dart';
import 'package:flutter_todolist/Pages/Transform/nav_transform.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideProfile_page.dart';
import 'package:flutter_todolist/Pages/WideScreen/wideToDo_page.dart';
import 'package:flutter_todolist/Pages/nav/mainNav_page.dart';
import 'package:flutter_todolist/Routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    // 🔹 MOBILE SCREENS
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
      name: AppRoutes.profilePage,
      page: () => ProfilePage(),
      binding: Authbinding(),
    ),

    // 🔹 WIDE SCREENS
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
      name: AppRoutes.wideProfilePage,
      page: () => WideprofilePage(),
      binding: Authbinding(),
    ),
    GetPage(
      name: AppRoutes.wideEditTodoPage,
      page: () => WideedittodoPage(),
      binding: Edittodobinding(),
    ),
    GetPage(
      name: AppRoutes.wideTodoPage,
      page: () => WidetodoPage(),
      binding: Taskbinding(),
    ),

    // 🔹 TRANSFORM SCREENS (Responsive)
    GetPage(
      name: AppRoutes.navTransform,
      page: () => NavTransform(),
      bindings: [Responsivebinding(), Mainnavbinding(), Authbinding()],
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
    GetPage(
      name: AppRoutes.historyTransform,
      page: () => HistoryTransform(),
      bindings: [Responsivebinding(), Taskbinding()],
    ),
    GetPage(
      name: AppRoutes.profileTransform,
      page: () => ProfileTransform(),
      bindings: [Responsivebinding(), Authbinding()],
    ),
    GetPage(
      name: AppRoutes.editTodoTransform,
      page: () => EdittodoTransform(),
      bindings: [Responsivebinding(), Taskbinding(), Edittodobinding()],
    ),
    GetPage(
      name: AppRoutes.todoTransform,
      page: () => TodoTransform(),
      bindings: [Responsivebinding(), Taskbinding()],
    ),

    // 🔹 NAVIGATION
    GetPage(
      name: AppRoutes.mainNav,
      page: () => MainnavPage(),
      binding: Mainnavbinding(),
    ),
  ];
}
