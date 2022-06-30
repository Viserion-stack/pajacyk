import 'package:flutter/material.dart';

abstract class AppRoute {
  Route<dynamic> route(RouteSettings settings);
}
