import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/app_assets.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/texts.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:pajacyk/presentation/screens/pajacyk/widgets/our_actions_widget.dart';
import 'package:pajacyk/presentation/screens/pajacyk/widgets/pajacyk_in_numbers_texts.dart';

class PajacykScreen extends StatelessWidget {
  const PajacykScreen({Key? key}) : super(key: key);

  static const String routeName = '/pajacyk';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: PajacykScreenContent(),
    );
  }
}

class PajacykScreenContent extends StatelessWidget {
  const PajacykScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Insets.xLarge),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
          child: Column(
            children: [
              PajacykCard(),
              SizedBox(height: Insets.large),
              WhatWeDoCard(),
              SizedBox(height: Insets.large),
              PajacykInNumbers(),
              SizedBox(height: Insets.large),
              OurActionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class PajacykCard extends StatelessWidget {
  const PajacykCard({Key? key}) : super(key: key);

  static const double textColorOpacity = 0.8;
  static const double textdescriptionSize = 18;
  static const double textTitleSize = 30;
  static const double imageHeight = 50;
  static const double imageWidth = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Insets.xLarge),
        color: context.palette.badgeColor1,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Insets.xLarge,
          vertical: Insets.xLarge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.appTitle.toUpperCase(),
              style: context.textTheme.caption!.copyWith(
                fontSize: textTitleSize,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(textColorOpacity),
              ),
            ),
            SizedBox(height: Insets.xLarge),
            Text(
              AppTexts.pajacykDescription,
              style: context.textTheme.bodyText2!.copyWith(
                color: Colors.white.withOpacity(textColorOpacity),
                fontSize: textdescriptionSize,
              ),
            ),
            SizedBox(height: Insets.xLarge),
            SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: Image.asset(
                AppAssets.pahImage,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhatWeDoCard extends StatelessWidget {
  const WhatWeDoCard({Key? key}) : super(key: key);

  static const double textColorOpacity = 0.8;
  static const double textTitleSize = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Insets.xLarge),
        color: context.palette.badgeColor1,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Insets.xLarge,
          vertical: Insets.xLarge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.whatWeDo.toUpperCase(),
              style: context.textTheme.caption!.copyWith(
                fontSize: textTitleSize,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(textColorOpacity),
              ),
            ),
            SizedBox(height: Insets.xLarge),
            PointerItem(descripttion: AppTexts.whatWeDoFirstPoint),
            SizedBox(height: Insets.xLarge),
            PointerItem(descripttion: AppTexts.whatWeDoSecondPoint),
            SizedBox(height: Insets.xLarge),
            PointerItem(descripttion: AppTexts.whatWeDoThirdPoint),
          ],
        ),
      ),
    );
  }
}

class PointerItem extends StatelessWidget {
  const PointerItem({
    required this.descripttion,
    Key? key,
  }) : super(key: key);

  final String descripttion;

  static const double _opacity = 0.8;
  static const double _textSize = 18;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(_opacity),
          shape: BoxShape.circle,
        ),
      ),
      title: Text(
        descripttion,
        style: context.textTheme.caption!.copyWith(
          color: Colors.white.withOpacity(_opacity),
          fontSize: _textSize,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    );
  }
}

class PajacykInNumbers extends StatelessWidget {
  const PajacykInNumbers({Key? key}) : super(key: key);

  static const double textTitleSize = 28;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.pajacykInNumbers.toUpperCase(),
              style: context.textTheme.caption!.copyWith(
                fontSize: textTitleSize,
                fontWeight: FontWeight.w600,
                color: context.palette.badgeColor1,
              ),
            ),
            SizedBox(
              height: Insets.xLarge,
            ),
            PajacykInNumbersItem(
              title: AppTexts.numberOfChildren,
              description: PajacykChildrensDescription(),
              imagePath: AppAssets.children,
            ),
            CustomDivider(),
            PajacykInNumbersItem(
              title: AppTexts.pajacykGeneral,
              description: PajacykGeneraly(),
              imagePath: AppAssets.pajacykGeneral,
            ),
            CustomDivider(),
            PajacykInNumbersItem(
              title: AppTexts.pajacykVacation,
              description: PajacykVacationDescription(),
              imagePath: AppAssets.pajacykVacation,
            ),
            CustomDivider(),
            PajacykInNumbersItem(
              title: AppTexts.pajacykPsychoHelp,
              description: PajacykPsychoHelpDescription(),
              imagePath: AppAssets.pajacykPsychoHelp,
            ),
            CustomDivider(),
            PajacykInNumbersItem(
              title: AppTexts.pajacykMeals,
              description: PajacykMealsDescription(),
              imagePath: AppAssets.pajacykMeals,
            ),
            CustomDivider(),
            PajacykInNumbersItem(
              title: AppTexts.pajacykHelpNetwork,
              description: PajacykHelpNetworkDescription(),
              imagePath: AppAssets.pajacykNetworkHelp,
            ),
            CustomDivider(),
            PajacykInNumbersItem(
              title: AppTexts.pajacykNoBreak,
              description: PajacykNoBreakDescription(),
              imagePath: AppAssets.pajacykNoBreak,
            ),
            CustomDivider(),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.xLarge,
        vertical: Insets.xLarge,
      ),
      child: Divider(
        indent: 30,
        endIndent: 30,
        thickness: 3,
        color: context.palette.primaryColor,
      ),
    );
  }
}
