import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/app_assets.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/pdf_files_https.dart';
import 'package:pajacyk/presentation/application/texts.dart';
import 'package:pajacyk/presentation/application/theme.dart';

import '../../common/launcher_url.dart';

class NaborScree extends StatelessWidget {
  const NaborScree({Key? key}) : super(key: key);

  static const String routeName = '/nabor';

  static const double cardRadius = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: Insets.xLarge),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Insets.xLarge,
                vertical: Insets.xxLarge,
              ),
              decoration: BoxDecoration(
                color: context.palette.cardColor,
                borderRadius: BorderRadius.circular(Insets.xLarge),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.cardTitle,
                    style: TextStyle(
                      color: Colors.amber[600],
                      fontSize: Insets.xxLarge,
                    ),
                  ),
                  const SizedBox(height: Insets.large),
                  const Text(AppTexts.cardDescription),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Insets.large),
                    child: Image.asset(AppAssets.naborCardImage),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      launchURL(PdfLauncher.nabor);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
