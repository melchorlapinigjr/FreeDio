import 'package:flutter/cupertino.dart';

abstract class DialogService {
  Future<dynamic> openDialog(Widget child, {bool barrierDismissible = true});

  void showLoadingDialog(String message);

  void closeDialog();
}
