import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dialog_service.dart';

class DialogServiceImpl extends DialogService {
  @override
  Future<dynamic> openDialog(Widget widget, {bool barrierDismissible = true}) {
    return Get.dialog(widget, barrierDismissible: barrierDismissible);
  }

  @override
  void showLoadingDialog(String message) {
    openDialog(
        WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const CircularProgressIndicator(),

        ),
        barrierDismissible: false);
  }

  @override
  void closeDialog() {
    if (Get.isDialogOpen == true) Get.back();
  }
}
