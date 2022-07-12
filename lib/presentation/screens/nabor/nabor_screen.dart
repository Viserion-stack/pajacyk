import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NaborScree extends StatelessWidget {
  const NaborScree({Key? key}) : super(key: key);
  void _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.xLarge),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.xLarge),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'NABÓR DO\nPROGRAMU',
                        style: TextStyle(
                            color: Colors.amber[600], fontSize: Insets.xxLarge),
                      ),
                    ),
                    Text(
                      'W Twojej szkole, świetlicy, placówce wsparcia dziennego są dzieci, które potrzebują pomocy? Zgłoś się do programu Pajacyk i uzyskaj dofinansowanie na wsparcie.',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.asset('assets/nabor.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _launchURL('https://www.pajacyk.pl/nabor/');
                        },
                        child: Text(
                          'WIĘCEJ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber[600],
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
          ],
        ),
      ),
    );
  }
}
