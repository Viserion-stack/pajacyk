import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/controllers/navigation.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/api_calls.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                IconButton(
                  onPressed: () async {
                    await Provider.of<PostDataProvider>(context, listen: false)
                        .getPostData(context);
                    Provider.of<PostDataProvider>(context, listen: false)
                        .showPopUp(context);
                  },
                  icon: Icon(Icons.notification_add),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyCard(
                      //url: 'https://www.pajacyk.pl/wesprzyj',
                      headerText: 'WSPOMÓŻ \nPajacyka',
                      bodyText:
                          'Pomóż potrzebującym dzieciom przekazując darowiznę. Razem możemy tak wiele!',
                      buttonText: 'ZOBACZ JAK POMÓC',
                      buttonColor: Colors.pink[300],
                      buttonTextColor: Colors.white,
                      headerColor: Colors.pink[300],
                    ),
                    MyCard(
                      url: 'https://www.pajacyk.pl/nabor',
                      headerText: 'NABÓR \ndo programu',
                      bodyText:
                          'PW Twojej szkole, świetlicy, placówce wsparcia \ndziennego są dzieci, które potrzebują pomocy?\nZgłoś się do programu Pajacyk.',
                      buttonText: 'DOŁĄCZ DO PAJACYKA',
                      buttonColor: Colors.orange[500],
                      buttonTextColor: Colors.white,
                      headerColor: Colors.orange[500],
                    ),
                    MyCard(
                      imageIndex: 1,
                      url: 'https://www.pajacyk.pl/swiateczny-stol-pajacyka/',
                      headerText: 'Świąteczny Stół Pajacyka',
                      bodyText:
                          'Świąteczny Stół Pajacyka to ogólnopolska akcja charytatywna, podczas której właściciele lokali gastronomicznych przekazują 10% dziennego obrotu na posiłki dla potrzebujących dzieci.',
                      buttonText: 'WIĘCEJ O AKCJI',
                      //buttonColor: Colors.orange[500],
                      //buttonTextColor: Colors.white,
                      cardColor: Colors.yellow,
                    ),
                    MyCard(
                      imageIndex: 2,
                      url: 'https://www.pajacyk.pl/pajacyk-bez-przerwy',
                      headerText: '#PajacykBezPrzerwy!',
                      bodyText:
                          'To akcja, która powstała jako odpowiedź na pandemię COVID-19. Jesteśmy czujni na potrzeby dzieci i dostosowujemy program tak, by nieść pomoc nieprzerwanie bez względu na okoliczności!',
                      buttonText: 'WIĘCEJ O AKCJI',
                      //buttonColor: Colors.orange[500],
                      //buttonTextColor: Colors.white,
                      cardColor: Colors.yellow,
                    ),
                    MyCarousel(),
                    SizedBox(
                      height: 20,
                    )
                  ],
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
  final Color? buttonColor;
  final Color? cardColor;
  final Color? headerColor;
  final Color? buttonTextColor;
  final int? imageIndex;

  const MyCard({
    Key? key,
    required this.headerText,
    required this.bodyText,
    required this.buttonText,
    this.url,
    this.buttonColor,
    this.cardColor,
    this.headerColor,
    this.buttonTextColor,
    this.imageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      width: size.width * 0.9,
      height: size.height * 0.35,
      child: Card(
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
                      color: headerColor ?? Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              bodyText,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            ElevatedButton(
              onPressed: () {
                if (url == null) {
                  Provider.of<NavigationController>(context, listen: false)
                      .changeScreen(2);
                } else {
                  _launchURL(url!);
                }
              },
              child: Text(
                buttonText,
                style: TextStyle(
                  color: buttonTextColor ?? Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  // side: BorderSide(
                  //   width: 1,
                  //   color: Colors.black,
                  //   //style: BorderStyle.solid,
                  // ),
                  primary: buttonColor ?? Colors.white,

                  //fixedSize: const Size(300, 100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCarousel extends StatelessWidget {
  MyCarousel({Key? key}) : super(key: key);
  List<String> partnerList = [
    'assets/partners/payBack.png',
    'assets/partners/dhl.png',
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Partnerzy Programu',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider.builder(
                itemCount: partnerList.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  //print(itemIndex);
                  return Container(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 170,
                        child: Image.asset(
                          '${partnerList[itemIndex]}',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  //aspectRatio: 16 / 9,
                  viewportFraction: 0.7,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  //onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                )),
            ElevatedButton(
              onPressed: () {
                Provider.of<NavigationController>(context, listen: false)
                    .changeScreen(5);
              },
              child: Text(
                'ZOBACZ WIĘCEJ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  // side: BorderSide(
                  //   width: 1,
                  //   color: Colors.black,
                  //   //style: BorderStyle.solid,
                  // ),
                  primary: Colors.green,

                  //fixedSize: const Size(300, 100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ],
        ),
      ),
    );
  }
}
