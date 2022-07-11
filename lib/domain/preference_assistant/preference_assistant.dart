import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationNotifier with ChangeNotifier {
  late bool _isNotifi;
  bool get isNotifi => _isNotifi;
  NotificationNotifier() {
    _isNotifi = false;
    _loadFromPrefs();
    notifyListeners();
  }

  toogleNotifi(bool value) {
    _isNotifi = value;
    notifyListeners();
    _saveToPrefs();
  }

  _loadFromPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isNotifi = preferences.getBool('notifi') ?? false;
    notifyListeners();
    return _isNotifi;
  }

  _saveToPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('notifi', _isNotifi);
  }
}
