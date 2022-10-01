import 'package:flutter/material.dart';
import 'package:free_radio_philippines/resources/colors.dart';

class MyPlayerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final double? iconSize;

  const MyPlayerButton(
      {Key? key,
      required this.onPressed,
      required this.iconData,
      this.iconSize = 42})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 54.0,
      child: IconButton(
        iconSize: iconSize,
        icon: Icon(iconData),
        onPressed: onPressed,
        color: MyColors.white,
      ),
    );
  }
}
