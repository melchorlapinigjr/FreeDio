import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';

abstract class SnackBarService {
  SnackbarController showSnackBar(String message,
      {TextButton mainButton, Duration duration});
}
