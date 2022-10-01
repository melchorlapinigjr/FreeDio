import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'snack_bar_service.dart';

class SnackBarServiceImpl extends SnackBarService {
  @override
  SnackbarController showSnackBar(String message,
      {TextButton? mainButton,
      Color backgroundColor = const Color(0xFF303030),
      Duration? duration}) {
    return GetSnackBar(
            message: message,
            duration: duration ?? const Duration(seconds: 2, milliseconds: 500),
            margin: const EdgeInsets.all(20),
            snackStyle: SnackStyle.FLOATING,
            animationDuration: const Duration(milliseconds: 500),
            borderRadius: 12,
            backgroundColor: backgroundColor,
            mainButton: mainButton)
        .show();
  }
}
