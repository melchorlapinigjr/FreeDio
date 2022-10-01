
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:free_radio_philippines/core/models/station_object.dart';
import 'package:free_radio_philippines/resources/colors.dart';

class MyStationCardItemView extends StatelessWidget {
  final StationObject stationObject;
  final VoidCallback onTap;

  const MyStationCardItemView(
      {Key? key, required this.stationObject, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Card(
        color: MyColors.white,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: stationObject.image ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Container(
              color: MyColors.black.withOpacity(.6),
              height: 36,
              width: double.infinity,
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              child: Text(
                stationObject.name ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: MyColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
