import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:pajacyk/domain/notification_assistant/notification_assistant.dart';
import 'package:pajacyk/domain/preference_assistant/preference_assistant.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension DomainInjector on GetIt {
  Future<void> registerDomain() async {
    //NotificationApi.init();
    // listenNotifications();
    final sharedPreferences = await SharedPreferences.getInstance();
    final flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
    final onNotification = BehaviorSubject();
    this
      .._registerUseCases()
      ..registerFactory<SharedPreferences>(() => sharedPreferences)
      ..registerFactory<PreferenceAssistant>(() => PreferenceAssistant(sharedPreferences: sharedPreferences))
      ..registerFactory<FlutterLocalNotificationsPlugin>(() => flutterNotificationPlugin)
      ..registerFactory<BehaviorSubject>(() => onNotification)
      ..registerFactory<NotificationApi>(() => NotificationApi());
  }

  void _registerUseCases() {}
}
