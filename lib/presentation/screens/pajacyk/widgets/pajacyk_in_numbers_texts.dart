import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pajacyk/presentation/application/app_assets.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/texts.dart';
import 'package:pajacyk/presentation/application/theme.dart';

class PajacykInNumbersItem extends StatelessWidget {
  const PajacykInNumbersItem({
    required this.title,
    required this.imagePath,
    required this.description,
    Key? key,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(child: Image.asset(imagePath)),
        SizedBox(height: Insets.large),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.caption!.copyWith(
            color: context.palette.badgeColor1,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: Insets.small),
        description,
      ],
    );
  }
}

class PajacykChildrensDescription extends StatelessWidget {
  const PajacykChildrensDescription({Key? key}) : super(key: key);

  static const double _colorOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppTexts.numberOfChildrenDescription,
        style: context.textTheme.caption!.copyWith(
          color: context.palette.badgeColor1.withOpacity(_colorOpacity),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PajacykGeneraly extends StatelessWidget {
  const PajacykGeneraly({Key? key}) : super(key: key);

  static const double _colorOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    final splittedText = AppTexts.pajacykGeneralDesription.split(' ');
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: splittedText[0] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[1] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[2] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[3] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[4] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[5] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[6] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PajacykVacationDescription extends StatelessWidget {
  const PajacykVacationDescription({Key? key}) : super(key: key);

  static const double _colorOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    final splittedText = AppTexts.pajacykVacationDescription.split(' ');
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: splittedText[0] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[1] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[2] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[3] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[4] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[5] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[6] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PajacykPsychoHelpDescription extends StatelessWidget {
  const PajacykPsychoHelpDescription({Key? key}) : super(key: key);

  static const double _colorOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    final splittedText = AppTexts.pajacykPsychoHelpDescription.split(' ');
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: splittedText[0] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[1] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[2] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[3] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[4] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[5] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[6] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[7] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[8] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[9] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[10] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[11] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PajacykMealsDescription extends StatelessWidget {
  const PajacykMealsDescription({Key? key}) : super(key: key);

  static const double _colorOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppTexts.pajacykMealsDescription,
        style: context.textTheme.caption!.copyWith(
          color: context.palette.badgeColor1.withOpacity(_colorOpacity),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PajacykHelpNetworkDescription extends StatelessWidget {
  const PajacykHelpNetworkDescription({Key? key}) : super(key: key);

  static const double _colorOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    final splittedText = AppTexts.pajacykHelpNetworkDescription.split(' ');
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: splittedText[0] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[1] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[2] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[3] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[4] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[5] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[6] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[7] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[8] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[9] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PajacykNoBreakDescription extends StatelessWidget {
  const PajacykNoBreakDescription({Key? key}) : super(key: key);

  static const double _colorOpacity = 0.8;

  @override
  Widget build(BuildContext context) {
    final splittedText = AppTexts.pajacykNoBreakDescription.split(' ');
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: splittedText[0] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[1] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[2] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[3] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[4] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[5] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[6] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[7] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: splittedText[8] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
            TextSpan(
              text: splittedText[9] + ' ',
              style: context.textTheme.caption!.copyWith(
                color: context.palette.badgeColor1.withOpacity(_colorOpacity),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
