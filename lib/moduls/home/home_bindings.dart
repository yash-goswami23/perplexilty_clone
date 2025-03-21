import 'package:get/get.dart';
import 'package:perplexilty_clone/moduls/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}