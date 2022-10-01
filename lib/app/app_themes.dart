import 'package:flutter/material.dart';
import 'package:free_radio_philippines/resources/colors.dart';
import 'package:get/get.dart';

class AppThemes {
  static ThemeData light = ThemeData(
      fontFamily: "CeraPro",
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      brightness: Brightness.light,
      primaryColor: MyColors.primary,
      secondaryHeaderColor: const Color(0xFFFFFAF6),
      bottomAppBarColor: Colors.white,
      toggleableActiveColor: MyColors.black,
      splashColor: MyColors.primary.withOpacity(0.1),
      highlightColor: MyColors.primary.withOpacity(0.1),
      hoverColor: MyColors.primary.withOpacity(0.1),
      buttonTheme: const ButtonThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minWidth: 10,
          height: 10),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        // Large Title
        headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: MyColors.primaryText),
        headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: MyColors.primaryText),
        // Typography
        headline3: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: MyColors.primaryText),
        // Paragraph
        headline4: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: MyColors.primaryText),
        // Headline 5
        headline5: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: MyColors.secondaryText),
        // Title 1
        headline6: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: MyColors.primaryText),
        bodyText1: TextStyle(
          color: MyColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        // Body
        bodyText2: TextStyle(
          color: MyColors.primaryText,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        // Subhead
        subtitle1: TextStyle(
          color: MyColors.primaryText,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        caption: TextStyle(
          color: MyColors.primaryText,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        // Button text
        button: TextStyle(
          color: MyColors.primaryText,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        // Call out
        subtitle2: TextStyle(
          color: MyColors.primaryText,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ));

  static ThemeData getCurrent() => Get.theme;

  static TextTheme getTextTheme() => Get.theme.textTheme;

  static TextStyle? getButtonStyle() => getTextTheme().button;

  static TextStyle? getBodyTextStyle() => getTextTheme().bodyText2;

  static TextStyle? getCalloutTextStyle() => getCurrent()
      .textTheme
      .button
      ?.copyWith(fontWeight: FontWeight.w400, color: MyColors.primaryText);

  static TextStyle? getFootnoteTextStyle() => getCurrent()
      .textTheme
      .button
      ?.copyWith(fontWeight: FontWeight.w400, fontSize: 12);

  static MediaQueryData getMediaQuery() => Get.mediaQuery;

  static BuildContext getContext() => Get.context!;
}
