import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void myPopUp(BuildContext context, String header, String message) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(header),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          elevation: 1,
          backgroundColor: Colors.green.withOpacity(0.6),
          title: Text(
            header,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 22,
            ),
          ),
          content: Text(
            message,
            // style: TextStyle(
            //     color: Colors.white.withOpacity(0.8),
            //     fontWeight: FontWeight.w100),
          ),
          contentTextStyle: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.normal),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Color.fromARGB(202, 255, 255, 255)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
