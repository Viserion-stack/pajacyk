// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/pdf_files_https.dart';
import 'package:pajacyk/presentation/application/theme.dart';

import '../../application/texts.dart';
import '../../common/launcher_url.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  static const String routeName = '/contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: Padding(
        padding: const EdgeInsets.only(top: Insets.xLarge),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
          child: Column(
            children: const [
              KontaktCard(),
              SizedBox(height: Insets.large),
              KontaktSzkolaCard(),
              SizedBox(height: Insets.large),
              KontaktWspolpracaCard(),
              SizedBox(height: Insets.large),
            ],
          ),
        )),
      ),
    );
  }
}

class KontaktCard extends StatelessWidget {
  const KontaktCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Insets.large, vertical: Insets.xLarge),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.palette.cardColor,
        borderRadius: BorderRadius.circular(Insets.xLarge),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppTexts.contactHeader1,
            style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.bold,
                fontSize: Insets.xmlarge),
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
          SizedBox(height: Insets.large),
        ],
      ),
    );
  }
}

class KontaktSzkolaCard extends StatelessWidget {
  const KontaktSzkolaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Insets.large, vertical: Insets.xLarge),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.palette.cardColor,
        borderRadius: BorderRadius.circular(Insets.xLarge),
      ),
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
                fontSize: Insets.xmlarge),
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
          SizedBox(height: Insets.large),
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
    );
  }
}

class KontaktWspolpracaCard extends StatelessWidget {
  const KontaktWspolpracaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Insets.large, vertical: Insets.xLarge),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.palette.cardColor,
        borderRadius: BorderRadius.circular(Insets.xLarge),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
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
                fontSize: Insets.xmlarge),
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
          SizedBox(height: Insets.large),
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
    );
  }
}
