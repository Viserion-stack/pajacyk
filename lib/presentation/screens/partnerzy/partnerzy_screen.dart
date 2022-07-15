import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/app_assets.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/pdf_files_https.dart';
import 'package:pajacyk/presentation/application/texts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/navigation.dart';

class PartnerzyScreen extends StatelessWidget {
  const PartnerzyScreen({Key? key}) : super(key: key);

  static const String routeName = '/partnerzy';

  static const double _bottomSpace = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyCard(
                  headerText: AppTexts.headerText,
                  bodyText: AppTexts.partnerzyBodyText,
                  buttonText: AppTexts.contactText,
                ),
                StrategiczniPartnerzy(),
                ZostanPartneremCard(),
                SizedBox(height: _bottomSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  void _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $url';
  }

  final String headerText;
  final String bodyText;
  final String buttonText;
  final String? url;
  final Color? cardColor;
  final int? imageIndex;

  const MyCard({
    Key? key,
    required this.headerText,
    required this.bodyText,
    required this.buttonText,
    this.url,
    this.cardColor,
    this.imageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
      child: Container(
        padding: EdgeInsets.only(bottom: Insets.xLarge),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: cardColor ?? Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageIndex == null
                      ? SizedBox.shrink()
                      : SizedBox(
                          width: size.width * 0.15,
                          height: size.height * 0.15,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset('assets/$imageIndex.png'),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Insets.large),
                    child: Text(
                      headerText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Text(
                  bodyText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Insets.large,
                  vertical: Insets.large,
                ),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (url == null) {
                        Provider.of<NavigationController>(context,
                                listen: false)
                            .changeScreen(5);
                      } else {
                        _launchURL(url!);
                      }
                    },
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Insets.large,
                  vertical: Insets.large,
                ),
                child: Image.asset(AppAssets.pajacykKontakt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StrategiczniPartnerzy extends StatelessWidget {
  StrategiczniPartnerzy({Key? key}) : super(key: key);

  final List<String> partnerList = [
    'assets/partners/santander.png',
    'assets/partners/alternberg.png',
    'assets/partners/electrolux.png',
    'assets/partners/dhl.png',
    'assets/partners/biedronka.png',
    'assets/partners/bp.png',
    'assets/partners/internationalPaper.png',
    'assets/partners/payBack.png',
    'assets/partners/independentTrader.png',
    'assets/partners/auchan.png',
    'assets/partners/sodexo.png',
    'assets/partners/apart.png',
    'assets/partners/panTabletka.png',
    'assets/partners/ncab.png',
    'assets/partners/amosFiorello.png',
    'assets/partners/kaufland.png',
  ];
  List<String> partnerWspierajacyList = [
    'assets/partners/lemoniq.png',
    'assets/partners/pryzmat.png',
    'assets/partners/deva.png',
    'assets/partners/oktawave.png',
    'assets/partners/upmore.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
      child: Container(
        padding: EdgeInsets.only(bottom: Insets.large),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    AppTexts.partnerzyStrategiczni,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: partnerList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          partnerList[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    AppTexts.partnerzyWspierajacy,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: partnerWspierajacyList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        partnerWspierajacyList[index],
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ZostanPartneremCard extends StatelessWidget {
  const ZostanPartneremCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchURL(String url) async {
      final Uri _url = Uri.parse(url);
      if (!await launchUrl(_url)) throw 'Could not launch $url';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
      child: Container(
        padding: EdgeInsets.only(bottom: Insets.xLarge),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Insets.xLarge,
              vertical: Insets.large,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.receIcon),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppTexts.partnerzyCardTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: AppTexts.partnerzyCardDescription),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Insets.large,
                    bottom: Insets.small,
                  ),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _launchURL(PdfLauncher.partnerzy);
                      },
                      child: Text(
                        AppTexts.cardButtonText,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
