import 'dart:async';
import 'dart:convert';
import 'package:web_socket_client/web_socket_client.dart';

class ChatWebService {
  static final ChatWebService _chatWebService = ChatWebService._internal();
  WebSocket? _socket;
  factory ChatWebService() => _chatWebService;
  ChatWebService._internal();

  final _searchResultController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _contentController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultController.stream;

  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  void connect() {
    _socket = WebSocket(Uri.parse('ws://localhost:8000/ws/chat'));

    _socket!.messages
        .timeout(
          onTimeout: (sink) {
            print("timeOut $sink");
          },
          Duration(seconds: 15),
        )
        .listen(
          (message) {
            final Map<String, dynamic> data = json.decode(message);
            // print(data['type']);
            if (data['type'] == 'search_result') {
              _searchResultController.add(data);
              // print("connet " + data['type']);
            } else if (data['type'] == 'content') {
              _contentController.add(data);
              // print("connet contentResult " + data.toString());
            }
          },
          onError: (e) {
            print("error of : " + e);
          },
          onDone: () {
            print('I am done');
          },
        );
    // _socket!.messages.timeout(timeLimit)
  }

  void chat(String query) {
    var payload = json.encode({"query": query});
    print("Sending payload: $payload");
    _socket!.send(payload);
  }
}
