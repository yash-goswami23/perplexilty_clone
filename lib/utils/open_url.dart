// import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

openUrl(String url) async {
  // if (!await launchUrl(Uri.parse(url))) {
  //   throw Exception('Could not launch $url');
  // }
  html.window.open(url, '');
}
