import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:rxdart/rxdart.dart';

void listenNotifications() =>
    NotificationApi.onNotifications.stream.listen(onClickedNotification);
void onClickedNotification(String? payload) {
  debugPrint('onClickedNotification');
  //f2f.openAppPage('Screen/Ventilator/Status');
  //f2f.openAppPage('Popup/Emergency');
}

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  static Future _notificationsDetails() async {
    const styleInformation = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("logo"),
      largeIcon: DrawableResourceAndroidBitmap("logo"),
      contentTitle: 'Demo notification ',
    );
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        colorized: true,

        'channel id', 'channel name',
        //channelDescription: 'channel description',
        //playSound: false,
        importance: Importance.defaultImportance,
        //styleInformation: styleInformation,

        icon: 'logoo',
        largeIcon: DrawableResourceAndroidBitmap("logo"),
      ),
      iOS: IOSNotificationDetails(
          //presentSound: false,
          ),
    );
  }

  static Future init({bool initScheduled = false}) async {
    tz.initializeTimeZones();
    const android = AndroidInitializationSettings('logoo');
    const ios = IOSInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);
    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
      },
    );
  }

  Future showNotofication({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationsDetails(),
        payload: payload,
      );
  Future showScheduledNotofication({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    int? seconds,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
            DateTime.now().add(Duration(seconds: seconds!)), tz.local),
        await _notificationsDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
}
