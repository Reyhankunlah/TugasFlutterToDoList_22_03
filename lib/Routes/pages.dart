import 'package:flutter_todolist/Bindings/appBinding.dart';
import 'package:flutter_todolist/Pages/editTodo_page.dart';
import 'package:flutter_todolist/Pages/login_page.dart';
import 'package:flutter_todolist/Pages/nav/mainNav_page.dart';
import 'package:flutter_todolist/Pages/toDo_page.dart';
import 'package:flutter_todolist/Routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
    GetPage(name: AppRoutes.toDoPage, page: () => ToDoPage()),
    GetPage(name: AppRoutes.editToDoPage, page: () => EditTodoPage()),
    GetPage(
      name: AppRoutes.mainNav,
      page: () => MainnavPage(),
      binding: Appbinding(),
    ),
  ];
}
