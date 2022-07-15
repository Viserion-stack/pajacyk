import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../domain/model/pajacyk_model.dart';
import '../../domain/notification_assistant/notification_assistant.dart';
import '../../domain/widgets/dialog.dart';

Future<PajacykModel> getSinglePostData(context) async {
  PajacykModel result = const PajacykModel(count: '0', done: false);
  try {
    Response response = await Dio().post('https://www.pajacyk.pl/api/clicks');
    if (response.statusCode == 200) {
      //print(response);
      final item = json.decode(response.toString());
      result = PajacykModel.fromJson(item);
    } else {
      // Toast.show("Data not found", context,
      //     duration: 2, backgroundColor: Colors.redAccent);
    }
  } catch (e) {
    debugPrint(e.toString());
  } finally {}

  return result;
}

class PostDataProvider with ChangeNotifier {
  PajacykModel pajacyk = const PajacykModel(count: '', done: false);
  bool loading = false;

  Future<void> getPostData(context) async {
    loading = true;
    pajacyk = await getSinglePostData(context);
    loading = false;

    notifyListeners();
  }

  void showPopUp(context) async {
    myPopUp(
        context, 'Dziękujemy :)', 'Dziś kliknęlo juz ${pajacyk.count} osób');
  }

  void setNextNotification(context) async {
    NotificationApi notificationApi = NotificationApi();
    notificationApi
        .showScheduledNotofication(
          title: 'Cześć!',
          body: 'Kliknij w brzuszek, aby pomóc dzieciom.',
          payload: 'PAYLOAD TEXT!!!',
          seconds: 3,
        )
        .then(
          (value) => debugPrint('NOTIFI'),
        );
  }
}