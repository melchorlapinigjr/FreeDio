import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'bottom_sheet_service.dart';

class BottomSheetServiceImpl extends BottomSheetService {
  @override
  Future<dynamic> openBottomSheet(Widget widget,
      {bool isDraggable = true, bool isDismissible = true}) {
    return Get.bottomSheet(
      widget,
      useRootNavigator: true,
      enableDrag: isDraggable,
      isDismissible: isDismissible,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      isScrollControlled: true,
    );
  }
}
