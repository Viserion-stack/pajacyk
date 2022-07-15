import 'package:flutter/material.dart';
import 'package:pajacyk/presentation/application/app_assets.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/texts.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../application/pdf_files_https.dart';

class OurActionWidget extends StatelessWidget {
  const OurActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppTexts.ourActions.toUpperCase(),
          style: context.textTheme.caption!.copyWith(
            color: context.palette.cardColor,
            fontSize: 33,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Insets.large),
        OurActionWidgetItem(
          title: AppTexts.ourActionsTutorial,
          description: AppTexts.ourActionsTutorialDescription,
          onTap: () => launchUrlString(
            PdfLauncher.tutorialPdf,
            mode: LaunchMode.externalApplication,
          ),
          imagePath: AppAssets.ourActionTutorial,
        ),
        const SizedBox(height: Insets.large),
        OurActionWidgetItem(
          title: AppTexts.ourActionsResult,
          description: AppTexts.ourActionsResultDescription,
          onTap: () => launchUrlString(
            PdfLauncher.resultsPdf,
            mode: LaunchMode.externalApplication,
          ),
          imagePath: AppAssets.ourTutorialResult,
        ),
        const SizedBox(height: Insets.large),
      ],
    );
  }
}

class OurActionWidgetItem extends StatelessWidget {
  const OurActionWidgetItem({
    required this.title,
    required this.description,
    required this.onTap,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.xLarge,
        vertical: Insets.xxLarge,
      ),
      decoration: BoxDecoration(
        color: context.palette.cardColor,
        borderRadius: BorderRadius.circular(Insets.xLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(child: Image.asset(imagePath)),
          const SizedBox(height: Insets.large),
          Text(
            title,
            style: context.textTheme.caption!.copyWith(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: Insets.large),
          Text(
            description,
            style: context.textTheme.caption!.copyWith(
              color: Colors.black,
              fontSize: Insets.large,
            ),
          ),
          const SizedBox(height: Insets.large),
          PdfButton(
            title: AppTexts.ourActionsButtonText,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class PdfButton extends StatelessWidget {
  const PdfButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  static const double _verticalPadding = 10;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: _verticalPadding,
        ),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(Insets.xLarge),
        ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: context.textTheme.caption!.copyWith(
              color: context.palette.cardColor,
              fontSize: Insets.large,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
