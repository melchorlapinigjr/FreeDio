import 'package:flutter/widgets.dart';

abstract class BottomSheetService {
  Future<dynamic> openBottomSheet(Widget widget,
      {bool isDraggable = true, bool isDismissible = true});
}
