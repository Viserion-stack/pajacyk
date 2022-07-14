import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _animation;

  void _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $url';
  }

  Future<void> _openFacebook() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/10150100801814768';
    } else {
      fbProtocolUrl = 'fb://profile/10150100801814768';
    }

    String fallbackUrl = 'https://www.facebook.com/PajacykPL';

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);

      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
      } else {
        await launchUrl(Uri.parse(fallbackUrl), mode: LaunchMode.externalApplication);
      }
    } catch (e, st) {
      // Handle this as you prefer
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  bool isPajactkPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Witaj w krainie Pajacyka!',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Pajacyk od wielu lat wspiera prawidłowy rozwój dzieci. Pamiętaj, że kliknięcie w brzuszek,to pierwszy krok, by pomóc.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/podest.png',
                      scale: 1,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(
                          () {
                            print('setState');
                            isPajactkPressed = true;
                          },
                        );
                        Future.delayed(
                          const Duration(seconds: 3),
                          () {
                            print('FutureDelyed');
                            setState(
                              () {
                                isPajactkPressed = false;
                              },
                            );
                          },
                        );
                      },
                      child: SizedBox(
                        width: 400,
                        height: 400,
                        child: FadeTransition(
                          opacity: _animation,
                          child: Image.asset(
                            isPajactkPressed ? 'assets/pajacykOn.png' : 'assets/pajacykOff.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeCard(
                      headerText: 'WSPOMÓŻ \nPajacyka',
                      bodyText: 'Pomóż potrzebującym dzieciom przekazując darowiznę. Razem możemy tak wiele!',
                      buttonText: 'ZOBACZ JAK POMÓC',
                      buttonColor: Colors.pink[300],
                      buttonTextColor: Colors.white,
                      headerColor: Colors.pink[300],
                    ),
                    HomeCard(
                      url: 'https://www.pajacyk.pl/nabor',
                      headerText: 'NABÓR \ndo programu',
                      bodyText:
                          'PW Twojej szkole, świetlicy, placówce wsparcia \ndziennego są dzieci, które potrzebują pomocy?\nZgłoś się do programu Pajacyk.',
                      buttonText: 'DOŁĄCZ DO PAJACYKA',
                      buttonColor: Colors.orange[500],
                      buttonTextColor: Colors.white,
                      headerColor: Colors.orange[500],
                    ),
                    HomeCard(
                      imageIndex: 1,
                      url: 'https://www.pajacyk.pl/swiateczny-stol-pajacyka/',
                      headerText: 'Świąteczny Stół Pajacyka',
                      bodyText:
                          'Świąteczny Stół Pajacyka to ogólnopolska akcja charytatywna, podczas której właściciele lokali gastronomicznych przekazują 10% dziennego obrotu na posiłki dla potrzebujących dzieci.',
                      buttonText: 'WIĘCEJ O AKCJI',
                      cardColor: Colors.yellow,
                    ),
                    HomeCard(
                      imageIndex: 2,
                      url: 'https://www.pajacyk.pl/pajacyk-bez-przerwy',
                      headerText: '#PajacykBezPrzerwy!',
                      bodyText:
                          'To akcja, która powstała jako odpowiedź na pandemię COVID-19. Jesteśmy czujni na potrzeby dzieci i dostosowujemy program tak, by nieść pomoc nieprzerwanie bez względu na okoliczności!',
                      buttonText: 'WIĘCEJ O AKCJI',
                      cardColor: Colors.yellow,
                    ),
                    MyCarousel(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                _openFacebook();
                              },
                              icon: Icon(
                                Icons.facebook_outlined,
                                size: 55,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Sprawdź nasz Facebook')
                          ],
                        ),
                        GestureDetector(
                          onTap: (() {
                            _launchURL('https://www.pah.org.pl');
                          }),
                          child: SizedBox(
                            width: 100,
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                'assets/pahLogo.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
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

class HomeCard extends StatelessWidget {
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

  const HomeCard({
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
      height: size.height * 0.38,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: cardColor ?? Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageIndex == null
                      ? SizedBox()
                      : SizedBox(
                          width: size.width * 0.15,
                          height: size.height * 0.1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              'assets/$imageIndex.png',
                              fit: BoxFit.contain,
                            ),
                          )),
                  Text(
                    headerText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: headerColor ?? Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  bodyText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (url == null) {
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
                    primary: buttonColor ?? Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCarousel extends StatelessWidget {
  MyCarousel({Key? key}) : super(key: key);
  final List<String> partnerList = [
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
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
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CarouselSlider.builder(
                itemCount: partnerList.length,
                itemBuilder: (
                  BuildContext context,
                  int itemIndex,
                  int pageViewIndex,
                ) {
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
                  viewportFraction: 0.67,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                )),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'ZOBACZ WIĘCEJ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
