import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:perplexilty_clone/moduls/chat/controller/chat_controller.dart';
import 'package:perplexilty_clone/utils/open_url.dart';
import 'package:perplexilty_clone/utils/theme/color.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  // isLoading value, searchResults value, listening the chatwebservice searchResultStream, then reinital the search results = event of searchresltstream and change is loading value,
  //
  // bool isLoading = true;
  // List searchResults = [
  //   {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
  //   {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
  //   {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
  //   {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
  // ];
  // @override
  // void initState() {
  //   super.initState();
  //   ChatWebService().searchResultStream.listen((event) {
  //     searchResults = event['data'];
  //     isLoading = false;
  //     setState(() {});
  //   });
  // }
  final ChatController chatController = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.source, color: Colors.white70),
            SizedBox(width: 8),
            Text(
              'Sources',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Obx(() {
          return Skeletonizer(
            effect: ShimmerEffect(
              baseColor: AppColors.searchBarBorder,
              highlightColor: AppColors.submitButton,
              duration: Duration(seconds: 5),
            ),
            enabled: chatController.isUrlLoading.value,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children:
                  chatController.searchResults
                      .map(
                        (e) => GestureDetector(
                          onTap: () async {
                            await openUrl(e['url']);
                          },
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.cardColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  e['title'],
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  e['url'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          );
        }),
      ],
    );
  }
}
