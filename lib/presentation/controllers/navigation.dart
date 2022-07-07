import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/screens/contact/contact_screen.dart';
import 'package:pajacyk/presentation/screens/partnerzy/partnerzy_screen.dart';
import 'package:pajacyk/presentation/screens/wesprzyj/wesprzyj_screen.dart';

import '../screens/pajacyk/pajacyk_screen.dart';
import '../screens/splash/splash_screen.dart';

enum Screens {
  splash,
  pajacyk,
  wesprzyj,
  nabor,
  inneAkcje,
  partnerzy,
  kontakt,
}

class NavigationController extends ChangeNotifier {
  String routeName = '/';
  int pageIndex = 0;

  void changeScreen(int index) {
    pageIndex = index;
    //print('INDEX form provider tabBar =  + ${index}');
    notifyListeners();
  }

  List<Page> pages = [
    MaterialPage(child: SplashScreen()),
    MaterialPage(child: PajacykScreen()),
    MaterialPage(child: WesprzyjScreen()),
    MaterialPage(child: ContactScreen()),
    MaterialPage(child: ContactScreen()),
    MaterialPage(child: PartnerzyScreen()),
    MaterialPage(child: PajacykScreen()),
  ];

  List<Tab> tabs = [
    Tab(text: 'Strona główna'),
    Tab(text: 'Pajacyk'),
    Tab(text: 'Wesprzyj'),
    Tab(text: 'Nabór'),
    Tab(text: 'Inne akcje'),
    Tab(text: 'Partnerzy'),
    Tab(text: 'Kontakt'),
  ];
  List<Page> getPages() {
    List<Page> pageList = [];

    pageList.add(const MaterialPage(child: SplashScreen()));

    switch (pageIndex) {
      case 0:
        pageList.add(const MaterialPage(child: SplashScreen()));
        break;
      case 1:
        pageList.add(const MaterialPage(child: PajacykScreen()));
        break;
      case 2:
        pageList.add(const MaterialPage(child: WesprzyjScreen()));
        break;
      case 3:
        pageList.add(const MaterialPage(child: WesprzyjScreen()));
        break;
      case 4:
        pageList.add(const MaterialPage(child: SplashScreen()));
        break;
      case 5:
        pageList.add(const MaterialPage(child: PartnerzyScreen()));
        break;
      case 6:
        pageList.add(const MaterialPage(child: ContactScreen()));
        break;
    }
    //print(pageList.length);
    //notifyListeners();
    return pageList;
  }
}
