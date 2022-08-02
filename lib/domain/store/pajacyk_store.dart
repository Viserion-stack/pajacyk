import 'package:fpdart/fpdart.dart';
import 'package:pajacyk/domain/preference_assistant/preference_assistant.dart';
import 'package:pajacyk/foundation/fpdarts.dart';

class PajacykStore {
  static const String _notifKey = 'notifKey';

  const PajacykStore({
    required PreferenceAssistant preferences,
  }) : _preferences = preferences;

  final PreferenceAssistant _preferences;

  TaskEither<Unit, bool> putNotificationInfo({required bool value}) {
    return tryCatchE<Unit, bool>(
      () async {
        final response = await _preferences.write(
          key: _notifKey,
          value: value,
        );
        return right(response);
      },
      (_, __) => unit,
    );
  }

  TaskEither<Unit, bool?> getNotificationInfo() {
    return tryCatchE<Unit, bool?>(
      () async {
        final value = _preferences.read<bool>(key: _notifKey);
        if (value == null) {
          return left(unit);
        }
        return right(value);
      },
      (_, __) => unit,
    );
  }
}
