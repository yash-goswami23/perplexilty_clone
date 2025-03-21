import 'package:flutter/material.dart';
import 'package:perplexilty_clone/moduls/home/view/widget/search_section.dart';
import 'package:perplexilty_clone/utils/theme/color.dart';
import 'package:perplexilty_clone/widgets/side_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   ChatWebService().connect();
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side Bar
          SideBar(),
          Expanded(
            child: Column(
              children: [
                // Search Section
                Expanded(child: SearchSection()),
                // Footer
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      footerText('Pro'),
                      footerText('Enterprice'),
                      footerText('Store'),
                      footerText('Blog'),
                      footerText('Careers'),
                      footerText('English (English)'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding footerText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: TextStyle(color: AppColors.footerGrey, fontSize: 14),
      ),
    );
  }
}
