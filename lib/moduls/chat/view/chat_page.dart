import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:perplexilty_clone/moduls/chat/controller/chat_controller.dart';
import 'package:perplexilty_clone/utils/theme/color.dart';
import 'package:perplexilty_clone/moduls/chat/view/widgets/answer_section.dart';
import 'package:perplexilty_clone/widgets/side_bar.dart';
import 'package:perplexilty_clone/moduls/chat/view/widgets/sources_section.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final ChatController chatController = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          SizedBox(width: 100),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatController.question.value,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  SourcesSection(),
                  AnswerSection(),
                ],
              ),
            ),
          ),
          Placeholder(strokeWidth: 0, color: AppColors.background),
        ],
      ),
    );
  }
}
