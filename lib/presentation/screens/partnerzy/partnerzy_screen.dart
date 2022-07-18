// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/app_assets.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/pdf_files_https.dart';
import 'package:pajacyk/presentation/application/texts.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:provider/provider.dart';
import '../../common/launcher_url.dart';
import '../../controllers/navigation.dart';

class PartnerzyScreen extends StatelessWidget {
  const PartnerzyScreen({Key? key}) : super(key: key);

  static const String routeName = '/partnerzy';

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
                MyCard(
                  headerText: AppTexts.headerText,
                  bodyText: AppTexts.partnerzyBodyText,
                  buttonText: AppTexts.contactText,
                ),
                SizedBox(height: Insets.large),
                StrategiczniPartnerzy(),
                SizedBox(height: Insets.large),
                ZostanPartneremCard(),
                SizedBox(height: Insets.large),
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
  final Color? cardColor;
  final int? imageIndex;

  const MyCard({
    Key? key,
    required this.headerText,
    required this.bodyText,
    required this.buttonText,
    this.url,
    this.cardColor,
    this.imageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Insets.xLarge,
        vertical: Insets.xxLarge,
      ),
      decoration: BoxDecoration(
        color: context.palette.cardColor,
        borderRadius: BorderRadius.circular(Insets.xLarge),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageIndex == null
                  ? const SizedBox.shrink()
                  : SizedBox(
                      width: size.width * 0.15,
                      height: size.height * 0.15,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset('assets/$imageIndex.png'),
                      ),
                    ),
              Text(
                headerText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: Insets.xmlarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: Insets.large),
          Text(
            bodyText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (url == null) {
                  Provider.of<NavigationController>(context, listen: false)
                      .changeScreen(5);
                } else {
                  launchURL(url!);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Insets.large,
              vertical: Insets.large,
            ),
            child: Image.asset(AppAssets.pajacykKontakt),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class StrategiczniPartnerzy extends StatelessWidget {
  const StrategiczniPartnerzy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Insets.xLarge),
        color: context.palette.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              AppTexts.partnerzyStrategiczni,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue[700],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: AppAssets.partnerList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    AppAssets.partnerList[index],
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              AppTexts.partnerzyWspierajacy,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: AppAssets.partnerWspierajacyList.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  AppAssets.partnerWspierajacyList[index],
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ZostanPartneremCard extends StatelessWidget {
  const ZostanPartneremCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Insets.xLarge),
        color: context.palette.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Insets.xLarge,
          vertical: Insets.xLarge,
        ),
        child: Column(
          children: [
            Image.asset(AppAssets.receIcon),
            Text.rich(
              const TextSpan(
                style: TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: AppTexts.partnerzyCardTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: AppTexts.partnerzyCardDescription),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                launchURL(PdfLauncher.partnerzy);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                AppTexts.cardButtonText,
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
