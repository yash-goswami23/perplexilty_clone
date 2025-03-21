import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:perplexilty_clone/moduls/chat/chat_binding.dart';
import 'package:perplexilty_clone/moduls/chat/view/chat_page.dart';
import 'package:perplexilty_clone/moduls/home/home_bindings.dart';
import 'package:perplexilty_clone/moduls/home/view/home_page.dart';
import 'package:perplexilty_clone/routes/app_routes.dart';

class AppPages {
  static const initial = AppRoutes.home;
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
  ];
}
