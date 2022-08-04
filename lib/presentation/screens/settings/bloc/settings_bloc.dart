import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/domain/usecase/get_notification_info_usecase.dart';
import 'package:pajacyk/domain/usecase/put_notification_info_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.getNotificationInfoUsecase,
    required this.putNotificationInfoUsecase,
  }) : super(SettingsState.initial()) {
    on<OnInitiatedEvent>(_onInitiated);
    on<ChangeStatusNotification>(_onChangedStatusNotification);
  }

  final GetNotificationInfoUsecase getNotificationInfoUsecase;
  final PutNotificationInfoUsecase putNotificationInfoUsecase;

  Future<void> _onInitiated(OnInitiatedEvent event, Emitter<SettingsState> emit) async {
    await getNotificationInfoUsecase
        .execute()
        .match(
          (_) => emit(
            state.copyWith(isNotifOn: false),
          ),
          (r) => emit(
            state.copyWith(isNotifOn: r),
          ),
        )
        .run();
  }

  Future<void> _onChangedStatusNotification(ChangeStatusNotification event, Emitter<SettingsState> emit) async {
    final newState = await putNotificationInfoUsecase
        .execute(param: PutNotificationInfoParam(isNotification: event.statusNotification))
        .match(
          (_) => state.copyWith(isNotifOn: false),
          (_) => state.copyWith(isNotifOn: event.statusNotification),
        )
        .run();

    emit(newState);
  }
}
