import 'dart:ui';

import 'package:flutter/material.dart';

class MyBlurredBackground extends StatelessWidget {
  final String? imageUrl;

  const MyBlurredBackground({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imageUrl ??
                  'http://clipart-library.com/image_gallery2/Radio-Free-PNG-Image.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.6),
          ),
        ));
  }
}
