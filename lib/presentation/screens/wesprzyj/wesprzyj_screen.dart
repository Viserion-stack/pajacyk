import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WesprzyjScreen extends StatelessWidget {
  const WesprzyjScreen({Key? key}) : super(key: key);

  static const String routeName = '/wesprzyj';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: WesprzyjWebview(),
        ),
      ),
    );
  }
}

class WesprzyjWebview extends StatefulWidget {
  const WesprzyjWebview({Key? key}) : super(key: key);

  @override
  State<WesprzyjWebview> createState() => _WesprzyjWebviewState();
}

class _WesprzyjWebviewState extends State<WesprzyjWebview> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.pajacyk.pl/wesprzyj/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
