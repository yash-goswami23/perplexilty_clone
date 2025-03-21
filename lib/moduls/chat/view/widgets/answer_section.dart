import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:perplexilty_clone/moduls/chat/controller/chat_controller.dart';
import 'package:perplexilty_clone/utils/theme/color.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  // bool isLoaidng = true;
  // String fullResponse = "";
  // @override
  // void initState() {
  //   super.initState();
  //   if (isLoaidng) {
  //     fullResponse = "";
  //   }
  //   ChatWebService().contentStream.listen((event) {
  //     fullResponse += event['data'];

  //     // print('asnewr call ' + fullResponse);
  //     isLoaidng = false;
  //     setState(() {});
  //   });
  // }
  final ChatController chatController = Get.find<ChatController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(
            'Perplexity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Obx(() {
          return Skeletonizer(
            effect: ShimmerEffect(
              baseColor: AppColors.searchBarBorder,
              highlightColor: AppColors.submitButton,
              duration: Duration(seconds: 3),
            ),
            enabled: chatController.isResponseLoading.value,
            child: Markdown(
              data: chatController.fullResponse.value,
              shrinkWrap: true,
              styleSheet: MarkdownStyleSheet.fromTheme(
                Theme.of(context),
              ).copyWith(
                codeblockDecoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                code: TextStyle(fontSize: 16),
              ),
            ),
          );
        }),
      ],
    );
  }
}
