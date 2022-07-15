// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/pdf_files_https.dart';

import '../../application/texts.dart';
import '../../common/launcher_url.dart';

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
            child: SizedBox(
                child: Column(
          children: const [
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
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: size.width * 0.9,
      height: size.height * 0.65,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppTexts.contactHeader1,
              style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: AppTexts.polAkcjaHumaniatarna,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: AppTexts.adresSolidarnosci,
                  ),
                  const TextSpan(
                    text: 'TELEFON: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: AppTexts.telPajacyk,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        makePhoneCall(AppTexts.telPajacyk);
                      },
                  ),
                  const TextSpan(
                    text: '\nE-mail: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: AppTexts.emailPajacyk,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        debugPrint('email');
                        sendAnEmail(AppTexts.emailPajacyk);
                      },
                  ),
                  const TextSpan(
                    text: '\nNIP: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: AppTexts.nip,
                  ),
                  const TextSpan(
                    text: '\nKRS: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: AppTexts.krs,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/pahLogo.png'),
            const Text.rich(
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
                    text: 'Alior Bank: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: AppTexts.bankaAccNumber),
                  TextSpan(
                    text: '\nIBAN: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: AppTexts.iban,
                  ),
                  TextSpan(
                    text: '\nSWIFT: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: AppTexts.swift,
                  ),
                  TextSpan(
                    text: 'z dopiskiem ',
                  ),
                  TextSpan(
                    text: '„Pajacyk”',
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
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: size.width * 0.9,
      height: size.height * 0.45,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/abc.png'),
            Text(
              AppTexts.contactHeader2,
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
                  style: const TextStyle(
                    //fontSize: 17,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: AppTexts.magdalenaJarnowska,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: '\nTELEFON: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: AppTexts.telMagdalenaPajacyk,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          makePhoneCall(AppTexts.telMagdalenaPajacyk);
                        },
                    ),
                    const TextSpan(
                      text: '\nE-mail: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: AppTexts.emailPajacyk,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          sendAnEmail(AppTexts.emailPajacyk);
                        },
                    ),
                    const TextSpan(
                      text: AppTexts.adresStwosza,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    launchURL(PdfLauncher.kontakt);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text(
                    AppTexts.cardMore,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: size.width * 0.9,
      height: size.height * 0.57,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/receIcon.png'),
            ),
            Text(
              AppTexts.contactHeader3,
              style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                      text: AppTexts.emailBiznes,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          sendAnEmail(AppTexts.emailBiznes);
                        },
                    ),
                    TextSpan(text: 'Zadzwoń pod numer:\n'),
                    TextSpan(
                      text: AppTexts.telBiznes,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          makePhoneCall(AppTexts.telBiznes);
                        },
                    ),
                    TextSpan(text: '\nWyślij wiadomość za pomocą '),
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
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    launchURL(PdfLauncher.kontakt);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text(
                    AppTexts.wspolpracaButton,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
