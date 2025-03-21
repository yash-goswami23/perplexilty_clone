import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexilty_clone/moduls/home/controller/home_controller.dart';
import 'package:perplexilty_clone/utils/theme/color.dart';
import 'package:perplexilty_clone/widgets/search_bar_button.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final HomeController homeController = Get.find<HomeController>();
  final queryController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Where knowledge begins ',
          style: GoogleFonts.ibmPlexMono(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          width: 700,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.searchBarBorder, width: 1.5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    hintText: 'Search anything...',
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SearchBarButton(
                          text: 'Focus',
                          iconData: Icons.auto_awesome_outlined,
                        ),
                        const SizedBox(width: 12),
                        SearchBarButton(
                          text: 'Attach',
                          iconData: Icons.add_circle_outline,
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // call chat method and also navigate chat screen
                        // ChatWebService().chat(queryController.text);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder:
                        //         (context) => ChatPage(
                        //           question: queryController.text.trim(),
                        //         ),
                        //   ),
                        // );
                          homeController.nowChat(
                            query: queryController.text.trim(),
                          );

                      },
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: AppColors.submitButton,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.background,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
