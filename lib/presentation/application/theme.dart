// ignore_for_file: overridden_fields
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Palette {
  late Brightness brightness;
  late Color darkGrayColor;
  late Color shadowColor;
  late Color inactiveColor;
  late Color snackBarColor;
  late Color cardColor;
  late Color primaryColor;
  late Color primaryDarkColor;
  late Color primaryLightColor;
  late Color accentColor;
  late Color accentVariantColor;
  late Color errorColor;
  late Color iconColor;
  late Color backgroundColor;
  late Color appBarBackgroundColor;
  late Color textOnPrimaryColor;
  late Color primaryTextDisplayColor;
  late Color primaryTextBodyColor;
  late Color badgeColor1;
  late Color badgeColor2;
  late Color badgeColor3;
  late Color badgeColor4;
}

class LightPalette extends Palette {
  @override
  final Brightness brightness = Brightness.light;
  @override
  final Color shadowColor = const Color(0x1A3C640D);
  @override
  final Color darkGrayColor = const Color(0xff8D8B8B);
  @override
  final Color inactiveColor = const Color(0xffD4D4D4);
  @override
  final Color snackBarColor = const Color(0xb3000000);
  @override
  final Color cardColor = const Color(0xffffffff);
  @override
  final Color primaryColor = Colors.green;
  @override
  final Color primaryDarkColor = const Color(0xff112C4B);
  @override
  final Color primaryLightColor = const Color(0xff486383);
  @override
  final Color accentColor = const Color(0xff1FA0B0);
  @override
  final Color accentVariantColor = const Color(0xff84B340);
  @override
  final Color errorColor = const Color(0xffEB4B48);
  @override
  final Color iconColor = const Color(0xff163567);
  @override
  final Color backgroundColor = const Color(0xffF7F7F7);
  @override
  final Color textOnPrimaryColor = Colors.white;
  @override
  final Color primaryTextBodyColor = const Color(0xff000000);
  @override
  final Color primaryTextDisplayColor = const Color(0xff173047);
  @override
  final Color appBarBackgroundColor = const Color(0xff231F20);
  @override
  final Color badgeColor1 = const Color(0xff3070B6);
  @override
  final Color badgeColor2 = const Color(0xff0022AA);
  @override
  final Color badgeColor3 = const Color(0xffC4C4C4);
  @override
  final Color badgeColor4 = const Color(0xff8D8D8D);
}

// todo: correct it
class DarkPalette extends Palette {
  @override
  final Brightness brightness = Brightness.light;
  @override
  final Color shadowColor = const Color(0x1A3C640D);
  @override
  final Color darkGrayColor = const Color(0xff8D8B8B);
  @override
  final Color inactiveColor = const Color(0xffD4D4D4);
  @override
  final Color snackBarColor = const Color(0xb3000000);
  @override
  final Color cardColor = const Color(0xffffffff);
  @override
  final Color primaryColor = const Color(0xffF2EB2F);
  @override
  final Color primaryDarkColor = const Color(0xff112C4B);
  @override
  final Color primaryLightColor = const Color(0xff486383);
  @override
  final Color accentColor = const Color(0xff1FA0B0);
  @override
  final Color accentVariantColor = const Color(0xff84B340);
  @override
  final Color errorColor = const Color(0xffEB4B48);
  @override
  final Color iconColor = const Color(0xff163567);
  @override
  final Color backgroundColor = const Color(0xffF7F7F7);
  @override
  final Color textOnPrimaryColor = Colors.white;
  @override
  final Color primaryTextBodyColor = const Color(0xff000000);
  @override
  final Color primaryTextDisplayColor = const Color(0xff173047);
  @override
  final Color appBarBackgroundColor = const Color(0xff231F20);
  @override
  final Color badgeColor1 = const Color(0xff1FA0B0);
  @override
  final Color badgeColor2 = const Color(0xff0022AA);
  @override
  final Color badgeColor3 = const Color(0xffC4C4C4);
  @override
  final Color badgeColor4 = const Color(0xff8D8D8D);
}

class AppTheme {
  static Palette paletteOf(BuildContext context) {
    if (context.theme.brightness == Brightness.light) {
      return LightPalette();
    } else if (context.theme.brightness == Brightness.dark) {
      return DarkPalette();
    } else {
      return LightPalette();
    }
  }

  ThemeData theme(Palette palette) {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: generateMaterialColor(palette.primaryColor),
        primaryColorDark: palette.primaryDarkColor,
        accentColor: palette.accentColor,
        cardColor: palette.cardColor,
        backgroundColor: palette.backgroundColor,
        brightness: palette.brightness,
      ).copyWith(
        secondaryContainer: palette.accentVariantColor,
        tertiary: palette.primaryTextBodyColor,
        tertiaryContainer: palette.inactiveColor,
        primaryContainer: palette.darkGrayColor,
        surfaceVariant: palette.textOnPrimaryColor,
        outline: palette.badgeColor4,
        inversePrimary: palette.appBarBackgroundColor,
        inverseSurface: palette.badgeColor3,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryTextTheme: _textThemeHandset.apply(
        bodyColor: palette.primaryTextBodyColor,
        displayColor: palette.primaryTextDisplayColor,
      ),
      textTheme: _textThemeHandset.apply(
        bodyColor: palette.primaryTextBodyColor,
        displayColor: palette.primaryTextDisplayColor,
      ),
      iconTheme: IconThemeData(color: palette.iconColor),
      canvasColor: palette.backgroundColor,
      backgroundColor: palette.backgroundColor,
      scaffoldBackgroundColor: palette.backgroundColor,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: palette.brightness,
          statusBarIconBrightness: palette.brightness,
          systemNavigationBarIconBrightness: palette.brightness,
        ),
        toolbarTextStyle: TextStyle(color: palette.primaryColor),
        titleTextStyle: TextStyle(
            color: palette.textOnPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14),
        color: palette.appBarBackgroundColor,
        iconTheme: IconThemeData(color: palette.textOnPrimaryColor),
        actionsIconTheme: IconThemeData(color: palette.textOnPrimaryColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: palette.accentVariantColor),
        unselectedIconTheme: IconThemeData(color: palette.primaryColor),
        selectedItemColor: palette.accentVariantColor,
        unselectedItemColor: palette.primaryColor,
        selectedLabelStyle: TextStyle(color: palette.accentVariantColor),
        unselectedLabelStyle: TextStyle(color: palette.primaryColor),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
    return theme.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: palette.accentVariantColor),
      ),
    );
  }

  TextTheme get _textThemeHandset => TextTheme(
        headline1: GoogleFonts.jost(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.48,
        ),
        headline2: GoogleFonts.jost(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.48,
        ),
        headline3: GoogleFonts.jost(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.48,
        ),
        headline5: GoogleFonts.jost(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.408,
        ),
        headline6: GoogleFonts.jost(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.078,
        ),
        subtitle1: GoogleFonts.jost(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.19,
        ),
        subtitle2: GoogleFonts.jost(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.64,
        ),
        bodyText1: GoogleFonts.jost(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.32,
        ),
        bodyText2: GoogleFonts.jost(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.32,
        ),
        button: GoogleFonts.jost(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.32,
        ),
        caption: GoogleFonts.jost(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.32,
        ),
        overline: GoogleFonts.jost(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.64,
        ),
      );

  MaterialColor generateMaterialColor(Color color) =>
      MaterialColor(color.value, {
        50: tintColor(color, 0.9),
        100: tintColor(color, 0.8),
        200: tintColor(color, 0.6),
        300: tintColor(color, 0.4),
        400: tintColor(color, 0.2),
        500: color,
        600: shadeColor(color, 0.1),
        700: shadeColor(color, 0.2),
        800: shadeColor(color, 0.3),
        900: shadeColor(color, 0.4),
      });

  int tintValue(int value, double factor) => max(
        0,
        min((value + ((255 - value) * factor)).round(), 255),
      );

  Color tintColor(Color color, double factor) => Color.fromRGBO(
        tintValue(color.red, factor),
        tintValue(color.green, factor),
        tintValue(color.blue, factor),
        1,
      );

  int shadeValue(int value, double factor) => max(
        0,
        min(value - (value * factor).round(), 255),
      );

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
        shadeValue(color.red, factor),
        shadeValue(color.green, factor),
        shadeValue(color.blue, factor),
        1,
      );
}

extension AppThemes on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppBarTheme get appBarThemes => theme.appBarTheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Palette get palette => AppTheme.paletteOf(this);

  ColorScheme get colors => theme.colorScheme;
}
