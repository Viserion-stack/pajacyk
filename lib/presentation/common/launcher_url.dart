import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) throw 'Could not launch $url';
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> sendAnEmail(String emailTo) async {
  final Uri launchUri = Uri(
    scheme: 'mailto',
    path: emailTo,
  );
  await launchUrl(launchUri);
}

Future<void> openFacebook() async {
  String fbProtocolUrl;
  if (Platform.isIOS) {
    fbProtocolUrl = 'fb://profile/10150100801814768';
  } else {
    fbProtocolUrl = 'fb://profile/10150100801814768';
  }

  String fallbackUrl = 'https://www.facebook.com/PajacykPL';

  try {
    Uri fbBundleUri = Uri.parse(fbProtocolUrl);
    var canLaunchNatively = await canLaunchUrl(fbBundleUri);

    if (canLaunchNatively) {
      launchUrl(fbBundleUri);
    } else {
      await launchUrl(Uri.parse(fallbackUrl),
          mode: LaunchMode.externalApplication);
    }
  } catch (e, st) {
    // Handle this as you
    debugPrint(e.toString());
    debugPrint(st.toString());
  }
}
