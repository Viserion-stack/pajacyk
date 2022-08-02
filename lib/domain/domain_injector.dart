import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:pajacyk/domain/notification_assistant/notification_assistant.dart';
import 'package:pajacyk/domain/preference_assistant/preference_assistant.dart';
import 'package:pajacyk/domain/store/pajacyk_store.dart';
import 'package:pajacyk/domain/usecase/click_pajacyk_usecase.dart';
import 'package:pajacyk/domain/usecase/get_notification_info_usecase.dart';
import 'package:pajacyk/domain/usecase/put_notification_info_usecase.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension DomainInjector on GetIt {
  Future<void> registerDomain() async {
    NotificationApi.init();
    listenNotifications();
    final sharedPreferences = await SharedPreferences.getInstance();
    final flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
    final onNotification = BehaviorSubject();
    this
      .._registerUseCases()
      ..registerFactory<SharedPreferences>(() => sharedPreferences)
      ..registerFactory<PreferenceAssistant>(() => PreferenceAssistant(sharedPreferences: sharedPreferences))
      ..registerFactory<FlutterLocalNotificationsPlugin>(() => flutterNotificationPlugin)
      ..registerFactory<BehaviorSubject>(() => onNotification)
      ..registerFactory<NotificationApi>(() => NotificationApi())
      ..registerFactory<PajacykStore>(() => PajacykStore(preferences: get()));
  }

  void _registerUseCases() {
    this
      ..registerFactory<ClickPajacykUsecase>(
        () => ClickPajacykUsecase(
          clickPajacykRemoteSourceAction: get(),
        ),
      )
      ..registerFactory<GetNotificationInfoUsecase>(
        () => GetNotificationInfoUsecase(pajacykStore: get()),
      )
      ..registerFactory<PutNotificationInfoUsecase>(
        () => PutNotificationInfoUsecase(pajacykStore: get()),
      );
  }
}
