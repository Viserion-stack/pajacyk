import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../domain/widgets/dialog.dart';

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
  late WebViewController controller;
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    isLoading = true;
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      WebView(
        initialUrl: 'https://www.pajacyk.pl/wesprzyj',
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onWebViewCreated: (webViewController) {
          controller = webViewController;
        },
        onPageFinished: (String url) {
          setState(() {
            isLoading = false;
          });

          print('Page finished loading: $url');
        },
        onWebResourceError: (WebResourceError e) {
          print('WeResource error ${e.errorCode}');
          myPopUp(context, 'Bład ${e.errorCode}', ' ${e.domain}');
        },
      ),
      isLoading
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SizedBox(),
    ]);
  }
}
