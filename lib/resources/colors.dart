import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyColors {
  MyColors._();

  static bool get isDark => Get.theme.brightness == Brightness.dark;

  static const primary = Color(0xFFFAF6EB);
  static const accent = Color(0xFF172271);
  static const primaryText = Color(0xFF000000);
  static const secondaryText = Color(0xFF353B5A);
  static const dialogRed = Color(0xFFC52929);
  static const background = Color(0xFF3E4A6D);
  static var iconDark = Colors.grey[600];
  static const darkBlue = Color(0xFF2E3A59);

  // light
  static const lightTabBackground = Color(0xFFFAF6EB);
  static const lightTabIconSelected = accent;

  // dark
  static const darkTabBackground = Color(0xFFFAF6EB);
  static const darkTabIconSelected = Color(0xFFFDE7F1);
  static const lightGrey = Color(0xFFC9CBD7);
  static const lighterGrey = Color(0xFFE9EAEF);

  static const darkBackground = Color(0xFF353B5A);
  static const lightBackground = Colors.white;

  static var containerBackground = const Color(0xFFE5E7F8);
  static const barBackground = Color(0xFFE2E3EB);
  static const divider = Color(0xFFE2E3EB);
  static const confirmed = Color(0xFFE0F3EA);
  static const lighterGreen = Color(0xFFE0F3EA);

  static const hint = Color(0xFFC9CBD7);
  static const green = Color(0xFF108D59);
  static const lightGreen = Color(0xFF00990F);
  static const black = Color(0xFF000000);
  static const red = Colors.red;
  static const blue = Color(0xFF172271);
  static const orange = Color(0xFFD8890B);
  static const grey = Color(0xFFC9CBD7);
  static const white = Color(0xFFFFFFFF);
  static const dirtyWhite = Color(0xFFF4F4F4);

  static const notificationWarning = Color(0xFFFDE7F1);
  static const notificationDefault = Color(0xFFFAFAFD);

  static const buttonDefaultColor = Color(0xFFC9CBD7);
  static const buttonWarning = Color(0xFFC52929);

  static const betweenDateRangeBackground = Color(0xFFE5E7F8);
  static const snackBarDefaultBackground = Color(0xFFE8E9F0);

  static const snackBarErrorBackground = Color(0xFFF7EAEA);
  static const avatarBackground = Color(0xFFE2E3EA);

  static const paragraphTextColor = Color(0xFF344063);
  static const containerBorderColor = Color(0xFFE2E8F0);

  static const inputBorderColor = Color(0xFFDDE1ED);
  static const lightRed = Color(0xFFE33E3E);
  static const searchItemBackground = Color(0xFF3B81F7);
  static const asanaTagBackground = Color(0xFFE1726E);

  static const groupByDescriptionNumberColor = Color(0xFFC4C4C4);

  static const logConfirm = Color(0xFF353B5A);
  static const logConfirmed = Color(0xFFFFFFFF);
  static const logConfirmBackground = Color(0xFFE2E3EB);
  static const logConfirmedBackground = Color(0xFF63D581);

  static const checkedBox = Color(0XFF2E3A59);
  static const checkColor = Colors.white;
  static const unconfirmedAccess = Color(0xFFD93B3B);
  static const successColor = Color(0xFF4BB543);
}
