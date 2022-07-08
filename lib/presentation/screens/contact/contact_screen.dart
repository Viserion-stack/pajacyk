import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  static const String routeName = '/contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: Align(
        alignment: Alignment.topCenter,
        //color: Colors.green,
        child: SingleChildScrollView(
            child: Container(
                child: Column(
          children: [
            KontaktCard(),
            KontaktSzkolaCard(),
            KontaktWspolpracaCard(),
          ],
        ))),
      ),
    );
  }
}

class KontaktCard extends StatelessWidget {
  const KontaktCard({Key? key}) : super(key: key);

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
      height: size.height * 0.7,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'KONTAKT',
              style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'POSLKA AKCJA HUMANITARNA:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '\nal. Solidarności 78a, 00-145 Warszawa\n',
                  ),
                  TextSpan(
                    text: 'TELEFON:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' +48 22 828 88 82',
                  ),
                  TextSpan(
                    text: '\nE-mail:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'pah@pah.org.pl',
                  ),
                  TextSpan(
                    text: '\nNIP:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' 525-14-41-253',
                  ),
                  TextSpan(
                    text: '\nKRS:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' 0000136833',
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/pahLogo.png'),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Konta bankowe:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '\nNumer konta dedykowany programowi Pajacyk:\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Alior Bank:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' 02 2490 0005 0000 4600 8316 8772',
                  ),
                  TextSpan(
                    text: '\nIBAN:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'PL02 2490 0005 0000 4600 8316 8772',
                  ),
                  TextSpan(
                    text: '\nSWIFT:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' ALBPPLPW\n',
                  ),
                  TextSpan(
                    text: 'z dopiskiem ',
                  ),
                  TextSpan(
                    text: '\„Pajacyk”',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' w tytyle przelewu.',
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class KontaktSzkolaCard extends StatelessWidget {
  const KontaktSzkolaCard({Key? key}) : super(key: key);

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
      height: size.height * 0.45,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/abc.png'),
            Text(
              'KONTAKT DLA SZKÓŁ I ORGANIZACJI',
              style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
              textAlign: TextAlign.center,
            ),
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
                      text: 'Magdalena Jaranowska',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '\nTELEFON:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' +48 501 752 160',
                    ),
                    TextSpan(
                      text: '\nE-mail: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'pajacyk@pah.org.pl',
                    ),
                    TextSpan(
                      text: '\nul. Wita Stwosza 2, 87–100 Toruń',
                    ),
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
                    _launchURL('https://www.pajacyk.pl/kontakt/');
                  },
                  child: Text(
                    'WIĘCEJ',
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

class KontaktWspolpracaCard extends StatelessWidget {
  const KontaktWspolpracaCard({Key? key}) : super(key: key);

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
      height: size.height * 0.55,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/receIcon.png'),
            ),
            Text(
              'KONTAKT DLA OSÓB ZAINTERESOWANYCH WSPÓŁPRACĄ',
              style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
              textAlign: TextAlign.center,
            ),
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
                        text:
                            'Jesteś zainteresowany współpracą? Skontaktuj się z nami!\n'),
                    TextSpan(text: 'Jest na to kilka sposobów:\n'),
                    TextSpan(text: 'Napisz maila na adres:\n'),
                    TextSpan(
                      text: 'biznes@pah.org.pl\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'Zadzwoń pod numer:\n'),
                    TextSpan(
                      text: '+48 501 104 397\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: 'Wyślij wiadomość za pomocą '),
                    TextSpan(
                      text: 'formularza',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    'WSPÓŁPRACA',
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
