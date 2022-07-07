import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/navigation.dart';
import '../splash/splash_screen.dart';

class PartnerzyScreen extends StatelessWidget {
  const PartnerzyScreen({Key? key}) : super(key: key);

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
                  width: 0.9,
                  height: 1.1,
                  //url: 'https://www.pajacyk.pl/wesprzyj',
                  headerText: 'PARTNERZY',
                  bodyText:
                      'Program Pajacyk działa w dużej mierze dzięki wsparciu polskich firm. Partnerstwo opiera się na długofalowej współpracy. Naszym wspólnym celem jest zapewnienie posiłków dzieciom w szkołach i placówkach środowiskowych. Nasze działania, oprócz dożywiania, obejmują wsparcie psychospołeczne dzieci i młodzieży, nastawione na rozwój kompetencji życiowych, społecznych oraz zainteresowań.\nPoznaj Partnerów Pajacyka i dołącz do ich grona!',
                  buttonText: 'KONTAKT',
                ),
                StrategiczniPartnerzy(),
                ZostanPartneremCard(),
                SizedBox(
                  height: 20,
                )
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
  final double height;
  final double width;

  const MyCard({
    Key? key,
    required this.headerText,
    required this.bodyText,
    required this.buttonText,
    this.url,
    this.cardColor,
    this.imageIndex,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      width: size.width * width,
      height: size.height * height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: cardColor ?? Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageIndex == null
                    ? SizedBox()
                    : SizedBox(
                        width: size.width * 0.15,
                        height: size.height * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset('assets/$imageIndex.png'),
                        )),
                Text(
                  headerText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                bodyText,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (url == null) {
                      Provider.of<NavigationController>(context, listen: false)
                          .changeScreen(6);
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
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset('assets/pajacykKontakt.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class StrategiczniPartnerzy extends StatelessWidget {
  StrategiczniPartnerzy({Key? key}) : super(key: key);

  List<String> partnerList = [
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
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      width: size.width * 0.9,
      height: size.height * 1.83,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          //: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'PARTNERZY STRATEGICZNI',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: partnerList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          partnerList[index],
                          fit: BoxFit.contain,
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'PARTNERZY WSPIERAJĄCY',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: partnerWspierajacyList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          partnerWspierajacyList[index],
                          fit: BoxFit.contain,
                        ));
                  }),
            ),
          ],
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

    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      width: size.width * 0.9,
      height: size.height * 0.35,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/receIcon.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    //fontSize: 17,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Zostań naszym partnerem',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                        text:
                            '\nZobacz, jak Twoja firma może razem z nami zaangażować się we wspieranie najbardziej potrzebujących dzieci.'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _launchURL('https://www.pajacyk.pl/partnerzy/');
                  },
                  child: Text(
                    'ZOSTAŃ PARTNEREM',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
