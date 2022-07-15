import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/controllers/navigation.dart';
import 'package:provider/provider.dart';
import '../../../domain/preference_assistant/preference_assistant.dart';
import '../../common/launcher_url.dart';
import '../../controllers/api_calls.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
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
    final notification =
        Provider.of<NotificationNotifier>(context, listen: true).isNotifi;
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: SingleChildScrollView(
        child: SizedBox(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Witaj w krainie Pajacyka!',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Pajacyk od wielu lat wspiera prawidłowy rozwój dzieci. Pamiętaj, że kliknięcie w brzuszek,to pierwszy krok, by pomóc.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
                  Image.asset(
                    'assets/podest.png',
                    scale: 1,
                    //fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                      width: 400,
                      height: 400,
                      child: FadeTransition(
                        opacity: _animation,
                        child: Image.asset(
                          isPajactkPressed
                              ? 'assets/pajacykOn.png'
                              : 'assets/pajacykOff.png',
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () async {
                          await Provider.of<PostDataProvider>(context,
                                  listen: false)
                              .getPostData(context);

                          setState(
                            () {
                              isPajactkPressed = true;

                              Provider.of<PostDataProvider>(context,
                                      listen: false)
                                  .showPopUp(context);
                            },
                          );

                          Future.delayed(
                            const Duration(seconds: 3),
                            () {
                              setState(() {
                                isPajactkPressed = false;
                              });
                              if (notification) {
                                Provider.of<PostDataProvider>(context,
                                        listen: false)
                                    .setNextNotification(context);
                              }
                            },
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: 65,
                          height: 65,
                        ),
                      ),
                    ),
                  ),
                ]),

                // IconButton(
                //   onPressed: () async {
                //     await Provider.of<PostDataProvider>(context, listen: false)
                //         .getPostData(context);

                //   },
                //   icon: Icon(Icons.notification_add),
                // ),
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
                    const MyCard(
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
                    const MyCard(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEve,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                openFacebook();
                              },
                              icon: const Icon(
                                Icons.facebook_outlined,
                                size: 55,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('Sprawdź nasz Facebook')
                          ],
                        ),
                        GestureDetector(
                          onTap: (() {
                            launchURL('https://www.pah.org.pl');
                          }),
                          child: SizedBox(
                            width: 100,
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                'assets/pahLogo.png',
                                // fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
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
      padding: const EdgeInsets.only(bottom: 16),
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
                      ? const SizedBox()
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
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  bodyText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    if (url == null) {
                      Provider.of<NavigationController>(context, listen: false)
                          .changeScreen(2);
                    } else {
                      launchURL(url!);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      // side: BorderSide(
                      //   width: 1,
                      //   color: Colors.black,
                      //   //style: BorderStyle.solid,
                      // ),
                      primary: buttonColor ?? Colors.white,

                      //fixedSize: const Size(300, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: buttonTextColor ?? Colors.black,
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
      child: SizedBox(
        width: size.width * 0.9,
        height: size.height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
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
                  return SizedBox(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 170,
                        child: Image.asset(
                          partnerList[itemIndex],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  //aspectRatio: 16 / 9,
                  viewportFraction: 0.67,

                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
              child: const Text(
                'ZOBACZ WIĘCEJ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
