import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static const String _assetPath = 'assets/image';

  //png
  static const String pahImage = 'assets/pah.png';
  static const String children = 'assets/children.png';
  static const String pajacykGeneral = 'assets/pajacykGeneral.png';
  static const String pajacykMeals = 'assets/pajacykMeals.png';
  static const String pajacykNetworkHelp = 'assets/pajacykNetworkHelp.png';
  static const String pajacykNoBreak = 'assets/pajacykNoBreak.png';
  static const String pajacykPsychoHelp = 'assets/pajacykPsychoHelp.png';
  static const String pajacykVacation = 'assets/pajacykVacation.png';
  static const String ourActionTutorial = 'assets/ourActionTutorial.png';
  static const String ourTutorialResult = 'assets/ourTutorialResult.png';
  static const String naborCardImage = 'assets/nabor.png';
  static const String pajacykKontakt = 'assets/pajacykKontakt.png';
  static const String receIcon = 'assets/receIcon.png';
  static const String pajacykOn = 'assets/pajacykOn.png';
  static const String pajacykOff = 'assets/pajacykOff.png';
  static const String podest = 'assets/podest.png';
  static const String pahLogo = 'assets/pahLogo.png';
  static const String abc = 'assets/abc.png';

  static List<String> partnerList = [
    'assets/partners/payBack.png',
    'assets/partners/dhl.png',
    'assets/partners/santander.png',
    'assets/partners/ncab.png',
    'assets/partners/internationalPaper.png',
    'assets/partners/sodexo.png',
    'assets/partners/languageSoulutions.png',
    'assets/partners/fris.png',
    'assets/partners/kaufland.png',
    'assets/partners/bp.png',
    'assets/partners/alternberg.png',
    'assets/partners/amosFiorello.png',
    'assets/partners/auchan.png',
    'assets/partners/panTabletka.png',
    'assets/partners/electrolux.png',
    'assets/partners/independentTrader.png',
  ];

  //svg
  static const String pajacykBackground = '$_assetPath/pajacyk_background.svg';
}

extension Assets on BuildContext {
  AssetImage assetImage(String name) => AssetImage(
        name,
      );

  SvgPicture svgImage(String name, {Color? color, Size? size}) => SvgPicture.asset(
        name,
        color: color,
        width: size?.width,
        height: size?.height,
        // package: AppAssets.package,
      );
}
