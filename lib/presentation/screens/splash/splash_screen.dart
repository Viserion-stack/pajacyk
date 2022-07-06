import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/api_calls.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: IconButton(
              onPressed: () async {
                await Provider.of<PostDataProvider>(context, listen: false)
                    .getPostData(context);
                Provider.of<PostDataProvider>(context, listen: false)
                    .showPopUp(context);
              },
              icon: Icon(Icons.notification_add)),
        ),
      ),
    );
  }
}
