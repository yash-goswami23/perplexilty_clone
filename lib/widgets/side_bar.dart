import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:perplexilty_clone/routes/app_pages.dart';
import 'package:perplexilty_clone/routes/app_routes.dart';
import 'package:perplexilty_clone/utils/theme/color.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapse = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: isCollapse ? 150 : 64,

      color: AppColors.sideNav,
      child: Column(
        children: [
          sideIcons(
            icon: Icons.auto_awesome_mosaic,
            size: isCollapse ? 45 : 30,
            margin: 16,
          ),
          sideIcons(
            icon: Icons.add,
            text: 'Home',
            color: AppColors.iconGrey,
            onTap: () {
              if (Get.currentRoute != AppRoutes.home) {
                Get.offAllNamed(AppRoutes.home);
              }
            },
          ),
          sideIcons(
            icon: Icons.search,
            text: 'Search',
            color: AppColors.iconGrey,
            onTap: () {
              if (Get.currentRoute != AppRoutes.home) {
                Get.offAllNamed(AppRoutes.home);
              }
            },
          ),
          sideIcons(
            icon: Icons.language,
            text: 'Spaces',
            color: AppColors.iconGrey,
            onTap: () {
              Get.snackbar(
                'Spaces',
                "Coming Features",
                animationDuration: Duration(milliseconds: 500),
                snackPosition: SnackPosition.TOP,
                maxWidth: Get.width / (5),
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.symmetric(vertical: 40),
                colorText: Colors.white38,
              );
            },
          ),
          sideIcons(
            icon: Icons.auto_awesome,
            text: 'Discover',
            color: AppColors.iconGrey,
            onTap: () {
              Get.snackbar(
                "Discover",
                "Coming Features",
                animationDuration: Duration(milliseconds: 500),
                snackPosition: SnackPosition.TOP,
                maxWidth: Get.width / (5),
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.symmetric(vertical: 40),
                colorText: Colors.white38,
              );
            },
          ),
          sideIcons(
            icon: Icons.cloud_outlined,
            text: 'Library',
            color: AppColors.iconGrey,
            onTap: () {
              Get.snackbar(
                "Library",
                "Coming Features",
                animationDuration: Duration(milliseconds: 500),
                snackPosition: SnackPosition.TOP,
                maxWidth: Get.width / (5),
                duration: Duration(milliseconds: 900),
                margin: EdgeInsets.symmetric(vertical: 40),
                colorText: Colors.white38,
              );
            },
          ),
          Spacer(),
          sideIcons(
            icon:
                isCollapse
                    ? Icons.keyboard_arrow_left
                    : Icons.keyboard_arrow_right,
            color: AppColors.iconGrey,
            onTap: () {
              isCollapse = !isCollapse;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget sideIcons({
    required icon,
    String? text,
    color = Colors.white,
    double size = 22,
    double margin = 14,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(vertical: margin, horizontal: 10),
        child: Row(
          mainAxisAlignment:
              text != null
                  ? isCollapse
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center
                  : MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: size),
            if (text == null || !isCollapse)
              SizedBox()
            else
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
