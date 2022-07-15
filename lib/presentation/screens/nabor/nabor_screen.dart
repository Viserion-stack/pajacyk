import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/app_assets.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/pdf_files_https.dart';
import 'package:pajacyk/presentation/application/texts.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NaborScree extends StatelessWidget {
  const NaborScree({Key? key}) : super(key: key);

  static const String routeName = '/nabor';

  void _launchURL(String url) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $url';
  }

  static const double cardRadius = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cardRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: Insets.large),
                      child: Text(
                        AppTexts.cardTitle,
                        style: TextStyle(
                          color: Colors.amber[600],
                          fontSize: Insets.xxLarge,
                        ),
                      ),
                    ),
                    const Text(AppTexts.cardDescription),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: Insets.large),
                      child: Image.asset(AppAssets.naborCardImage),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: Insets.large),
                      child: ElevatedButton(
                        onPressed: () {
                          _launchURL(PdfLauncher.nabor);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber[600],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          AppTexts.cardMore,
                          style: TextStyle(
                            color: Colors.white,
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
