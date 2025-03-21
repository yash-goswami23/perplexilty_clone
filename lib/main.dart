import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexilty_clone/routes/app_pages.dart';
import 'package:perplexilty_clone/routes/app_routes.dart';
import 'package:perplexilty_clone/utils/theme/color.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // adding getx state management
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme.copyWith(
            bodyMedium: TextStyle(fontSize: 15, color: AppColors.whiteColor),
          ),
        ),
      ),
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
      // home: HomePage(),
    );
  }
}
