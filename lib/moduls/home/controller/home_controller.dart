import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perplexilty_clone/data/services/chat_web_service.dart';
import 'package:perplexilty_clone/routes/app_routes.dart';
import 'package:perplexilty_clone/utils/theme/color.dart';

class HomeController extends GetxController {
  //  connect the ChatWebService
  @override
  void onInit() {
    super.onInit();
    ChatWebService().connect();
  }

  // call chat method and also navigate chat screen
  nowChat({required String query}) async {
    if (query.isEmpty) {
      Get.snackbar(
        "Queary is Empty",
        'Enter Some Queary aur Questions',
        animationDuration: Duration(milliseconds: 800),
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: Get.width / (5),
        duration: Duration(milliseconds: 1000),
        margin: EdgeInsets.symmetric(vertical: 40),
        colorText: AppColors.submitButton,
      );
    } else {
      ChatWebService().chat(query);
      Get.toNamed(AppRoutes.chat, arguments: {'question': query});
    }
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   ChatWebService().dispose();
  // }
}
