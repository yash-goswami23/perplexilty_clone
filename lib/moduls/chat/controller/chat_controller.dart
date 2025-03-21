import 'package:get/get.dart';
import 'package:perplexilty_clone/data/services/chat_web_service.dart';

class ChatController extends GetxController {
  RxString question = "".obs;
  RxBool isUrlLoading = true.obs;
  RxString fullResponse =
      """[
        {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
        {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
        {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
        {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
      ]""".obs;
  RxBool isResponseLoading = true.obs;
  RxList searchResults =
      [
        {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
        {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
        {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
        {"title": "jadkfhaoihfadh;fo", "url": "www.jadkfhaoihfadh.aiofo.com"},
      ].obs;

  @override
  void onInit() {
    super.onInit();
    question.value = Get.arguments['question'];
    ChatWebService().searchResultStream.listen((event) {
      if (isUrlLoading.value) {
        searchResults = [].obs;
      }
      isUrlLoading.value = false;
      searchResults.value = event['data'];
    });

    ChatWebService().contentStream.listen((event) {
      if (isResponseLoading.value) {
        fullResponse = "".obs;
      }
      isResponseLoading.value = false;
      fullResponse.value += event['data'];
    });
  }
}
