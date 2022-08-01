import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:pajacyk/presentation/application/app_assets.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/texts.dart';
import 'package:pajacyk/presentation/common/laucher_url.dart';
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
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                KontaktCard(),
                KontaktSzkolaCard(),
                KontaktWspolpracaCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KontaktCard extends StatelessWidget {
  const KontaktCard({Key? key}) : super(key: key);
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _sendAnEmail(String emailTo) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: emailTo,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.xLarge,
        vertical: Insets.large,
      ),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(Insets.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppTexts.contact,
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Insets.large),
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: AppTexts.pahText,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: AppTexts.pahAddress),
                        TextSpan(
                          text: AppTexts.pahTel,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: AppTexts.panNumber,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              _makePhoneCall('+48 22 828 88 82');
                            },
                        ),
                        TextSpan(
                          text: AppTexts.emailPah,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: AppTexts.pahEmailAddress,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              print('tel');
                              _sendAnEmail('pah@pah.org.pl');
                            },
                        ),
                        TextSpan(
                          text: AppTexts.nip,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: AppTexts.pahNip),
                        TextSpan(
                          text: AppTexts.krs,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: AppTexts.pahKrs),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Insets.large),
                  child: Image.asset('assets/pahLogo.png'),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: AppTexts.bankAccount,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: AppTexts.bankAccountPajacyk,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: AppTexts.aliorBank,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: AppTexts.accountNumber),
                      TextSpan(
                        text: AppTexts.iban,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: AppTexts.ibanPajacyk),
                      TextSpan(
                        text: AppTexts.swift,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: AppTexts.albpplpw),
                      TextSpan(text: AppTexts.zdopiskiem),
                      TextSpan(
                        text: AppTexts.pahPajacyk,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: AppTexts.wTytule),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KontaktSzkolaCard extends StatelessWidget {
  const KontaktSzkolaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _makePhoneCall(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    Future<void> _sendAnEmail(String emailTo) async {
      final Uri launchUri = Uri(
        scheme: 'mailto',
        path: emailTo,
      );
      await launchUrl(launchUri);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(Insets.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.abc),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Insets.large),
                  child: Text(
                    AppTexts.contactToSchool,
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Insets.large),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppTexts.magdalena,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: AppTexts.telefon,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: AppTexts.numberMagdalena,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              print('tel');
                              _makePhoneCall('+48 501 752 160');
                            },
                        ),
                        TextSpan(
                          text: AppTexts.email,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: AppTexts.website,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              print('tel');
                              _sendAnEmail(AppTexts.website);
                            },
                        ),
                        TextSpan(
                          text: AppTexts.address,
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
                        launchURL('https://www.pajacyk.pl/kontakt/');
                      },
                      child: Text(
                        AppTexts.contactMore,
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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

class KontaktWspolpracaCard extends StatelessWidget {
  const KontaktWspolpracaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.xLarge,
        vertical: Insets.large,
      ),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(Insets.large),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/receIcon.png'),
                ),
                Text(
                  AppTexts.contactInterestPeople,
                  style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Insets.large),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: AppTexts.contacttextOne),
                        TextSpan(text: AppTexts.contacttextTwo),
                        TextSpan(text: AppTexts.contacttextThree),
                        TextSpan(
                          text: AppTexts.biznes,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: AppTexts.contactCall),
                        TextSpan(
                          text: AppTexts.biznesTel,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: AppTexts.sendMessage),
                        TextSpan(
                          text: AppTexts.contactForm,
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                        launchURL('https://www.pajacyk.pl/partnerzy/');
                      },
                      child: Text(
                        AppTexts.cooperation,
                        style: TextStyle(color: Colors.white),
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
