import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/controllers/navigation.dart';
import 'package:provider/provider.dart';

import '../../components/circle_tab_indicator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
      print('lsitener tab contoller');

      //controller.animateTo(curretIndex1);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: TabBar(
          controller: controller,
          tabs: navigation.tabs,
          onTap: (currentIndex) {
            navigation.changeScreen(currentIndex);
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
      body: Navigator(
        pages: navigation.getPages(),
        onPopPage: (route, results) {
          print('zmiana strony');
          if (!route.didPop(results)) return false;
          return true;
        },
      ),
    );
  }
}
