import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pajacyk/presentation/router/app_route.dart';
import 'package:pajacyk/presentation/router/contact_route_factory.dart';
import 'package:pajacyk/presentation/router/home_route_factory.dart';
import 'package:pajacyk/presentation/router/pajacyk_route_factory.dart';
import 'package:pajacyk/presentation/screens/dashboard/bloc/dashboard_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    required Map<DashboardTab, GlobalKey<NavigatorState>> navigatorKeys,
  }) : _navigatorKeys = navigatorKeys;

  final Map<DashboardTab, GlobalKey<NavigatorState>> _navigatorKeys;

  static const String routeName = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 7, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return BlocBuilder<DashboardBloc, DashboardState>(
    //  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        backgroundColor: Colors.green[500],
        title: TabBar(
          controller: controller,
          tabs: const [
            Tab(text: 'Strona główna'),
            Tab(text: 'Pajacyk'),
            Tab(text: 'Wesprzyj'),
            Tab(text: 'Nabór'),
            Tab(text: 'Inne akcje'),
            Tab(text: 'Partnerzy'),
            Tab(text: 'Kontakt'),
          ],
          onTap: (currentIndex) {
            //print(currentIndex);
            context.read<DashboardBloc>().add(UpdateDashboardTab(
                tabIndex: DashboardTab.values[currentIndex]));

            print('form tabBar');
            print(context.read<DashboardBloc>().state.currentTab);
          },
          splashFactory: NoSplash.splashFactory,
          splashBorderRadius: BorderRadius.circular(40),
          labelPadding: const EdgeInsets.only(left: 5, right: 5),
          unselectedLabelStyle: const TextStyle(fontSize: 11),
          isScrollable: true,
          labelStyle: const TextStyle(fontSize: 15),
          unselectedLabelColor: Colors.white,
          labelColor: Colors.black54,
          indicator: CircleTabIndicator(color: Colors.black54, radius: 4),
        ),
      ),
      body: _DashboardContent(navigatorKeys: widget._navigatorKeys),
    );
    // },
    //);
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
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      print('from Build');
      print(context.read<DashboardBloc>().state.currentTab);
      return WillPopScope(
        onWillPop: () async =>
            !await navigatorKeys[state.currentTab]!.currentState!.maybePop(),
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
              navigatorKey: navigatorKeys[DashboardTab.wesprzyj],
              isCurrent: state.currentTab == DashboardTab.wesprzyj,
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

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
