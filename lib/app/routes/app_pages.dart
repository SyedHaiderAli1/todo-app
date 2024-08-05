import 'package:get/get.dart';

import '../../presentation/add_todo/bindings/add_todo_binding.dart';
import '../../presentation/add_todo/views/add_todo_view.dart';
import '../../presentation/splash/bindings/splash_binding.dart';
import '../../presentation/splash/views/splash_view.dart';
import '../../presentation/todo/bindings/todo_binding.dart';
import '../../presentation/todo/views/todo_view.dart';
import '../../presentation/welcome/bindings/welcome_binding.dart';
import '../../presentation/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TODO,
      page: () => const AddTodoView(),
      binding: AddTodoBinding(),
    ),
    GetPage(
      name: _Paths.TODO,
      page: () => const TodoView(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
