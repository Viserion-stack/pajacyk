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
                      url: 'https://www.pajacyk.pl/pajacyk-bez-przerwy',
                      headerText: '#PajacykBezPrzerwy!',
                      bodyText:
                          'To akcja, która powstała jako odpowiedź na pandemię COVID-19. Jesteśmy czujni na potrzeby dzieci i dostosowujemy program tak, by nieść pomoc nieprzerwanie bez względu na okoliczności!',
                      buttonText: 'WIĘCEJ O AKCJI',
                      //buttonColor: Colors.orange[500],
                      //buttonTextColor: Colors.white,
                      cardColor: Colors.yellow,
                    ),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      width: size.width * 0.9,
      height: size.height * 0.32,
      child: Card(
        color: cardColor ?? Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              headerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: headerColor ?? Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
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
