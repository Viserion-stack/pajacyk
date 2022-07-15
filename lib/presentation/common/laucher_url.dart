import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) throw 'Could not launch $url';
}
