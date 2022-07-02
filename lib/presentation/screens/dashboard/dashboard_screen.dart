import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/router/app_route.dart';
import 'package:pajacyk/presentation/router/contact_route_factory.dart';
import 'package:pajacyk/presentation/router/home_route_factory.dart';
import 'package:pajacyk/presentation/router/pajacyk_route_factory.dart';
import 'package:pajacyk/presentation/screens/dashboard/bloc/dashboard_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    required Map<DashboardTab, GlobalKey<NavigatorState>> navigatorKeys,
  }) : _navigatorKeys = navigatorKeys;

  final Map<DashboardTab, GlobalKey<NavigatorState>> _navigatorKeys;

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
      return Scaffold(
        body: _DashboardContent(navigatorKeys: _navigatorKeys),
      );
    });
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({
    required this.navigatorKeys,
    Key? key,
  }) : super(key: key);

  final Map<DashboardTab, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
      return WillPopScope(
        onWillPop: () async => !await navigatorKeys[state.currentTab]!.currentState!.maybePop(),
        child: Stack(
          children: [
            OffstageNavigator(
              navigatorKey: navigatorKeys[DashboardTab.home],
              isCurrent: state.currentTab == DashboardTab.home,
              appRoute: const HomeRouteFactory(),
            ),
            OffstageNavigator(
              navigatorKey: navigatorKeys[DashboardTab.pajacyk],
              isCurrent: state.currentTab == DashboardTab.pajacyk,
              appRoute: const PajacykRouteFactory(),
            ),
            OffstageNavigator(
              navigatorKey: navigatorKeys[DashboardTab.contact],
              isCurrent: state.currentTab == DashboardTab.contact,
              appRoute: const ContactRouteFactory(),
            ),
          ],
        ),
      );
    });
  }
}

class OffstageNavigator extends StatelessWidget {
  const OffstageNavigator({
    required this.navigatorKey,
    required this.isCurrent,
    required this.appRoute,
  });

  final bool isCurrent;
  final GlobalKey<NavigatorState>? navigatorKey;
  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isCurrent,
      child: Navigator(
        key: navigatorKey,
        onGenerateRoute: appRoute.route,
      ),
    );
  }
}
