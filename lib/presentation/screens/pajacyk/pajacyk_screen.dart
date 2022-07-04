import 'package:flutter/material.dart';

class PajacykScreen extends StatelessWidget {
  const PajacykScreen({Key? key}) : super(key: key);

  static const String routeName = '/pajacyk';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text('Pajacyk Screen'),
        ),
      ),
    );
  }
}
