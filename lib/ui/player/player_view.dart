import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:free_radio_philippines/app/app_themes.dart';
import 'package:free_radio_philippines/core/models/station_object.dart';
import 'package:free_radio_philippines/resources/colors.dart';
import 'package:free_radio_philippines/ui/common/constants.dart';
import 'package:free_radio_philippines/ui/player/player_view_model.dart';
import 'package:free_radio_philippines/ui/widgets/my_widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stacked/stacked.dart';

class PlayerView extends StatelessWidget {
  final StationObject stationObject;
  final AssetsAudioPlayer player;

  const PlayerView(
      {Key? key, required this.stationObject, required this.player})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlayerViewModel>.reactive(
        viewModelBuilder: () => PlayerViewModel(stationObject, player),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, widget) {
          return Scaffold(
            body: model.isBusy && model.stationDataObject == null
                ? const MyCircularProgressIndicator()
                : Stack(
                    children: [
                      backgroundView(context, model),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 74, bottom: 16, left: 24, right: 24.0),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                    height: 160,
                                    width: 160,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                    '${Constants.imageBaseUrl}${model.stationDataObject?.data.image}' ??
                                            ''),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RatingBarIndicator(
                                      rating: double.parse(model
                                              .stationDataObject
                                              ?.data
                                              .starRatingAverage ??
                                          "1"),
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    IconButton(
                                        onPressed: model.addOrRemoveToFavorites,
                                        icon: Icon(
                                          model.isInFavorites
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.redAccent,
                                          size: 32,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  model.stationDataObject?.data.title ?? '',
                                  textAlign: TextAlign.center,
                                  style: AppThemes.getTextTheme()
                                      .headline3
                                      ?.copyWith(color: MyColors.white),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: MyColors.black.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Text(
                                    model.stationDataObject?.data.desc ?? '',
                                    textAlign: TextAlign.center,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppThemes.getTextTheme()
                                        .bodyText1
                                        ?.copyWith(
                                            color: MyColors.grey, fontSize: 14),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Visibility(
                                  visible: model.isBuffering,
                                  child: const BufferingStationView(),
                                ),
                                Visibility(
                                  visible: !model.isBuffering,
                                  child: MyPlayerButton(
                                    key: const Key('control-playerState'),
                                    iconData: model.isPlaying
                                        ? Icons.pause_circle
                                        : Icons.play_circle,
                                    onPressed: model.playOrPause,
                                    iconSize: 72,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                      Positioned(
                        top: 48,
                        left: 4,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                          onPressed: model.onBackPressed,
                        ),
                      ),
                      Visibility(
                          visible:
                              model.stationDataObject != null && model.isBusy,
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: MyColors.black.withOpacity(.6),
                              child: const MyCircularProgressIndicator())),
                      Positioned(
                          bottom: 16,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Similar Stations:',
                                  style: AppThemes.getTextTheme()
                                      .headline6
                                      ?.copyWith(color: MyColors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                    color: MyColors.black.withOpacity(.4)),
                                child: SuggestedStationsView(
                                  onChanged: model.onChangedStation,
                                  stations:
                                      model.stationDataObject!.youMayLike!,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
          );
        });
  }

  SizedBox backgroundView(BuildContext context, PlayerViewModel model) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: MyBlurredBackground(
        imageUrl: '${Constants.imageBaseUrl}${model.stationDataObject?.data.image}',
      ),
    );
  }
}

class BufferingStationView extends StatelessWidget {
  const BufferingStationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 16,
        ),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 54,
          lineHeight: 8.0,
          percent: 1.0,
          restartAnimation: true,
          animation: true,
          animationDuration: 2000,
          animateFromLastPercent: true,
          barRadius: const Radius.circular(24),
          progressColor: Colors.green,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Loading station... Please take a cup of coffee while waiting :)',
          style: AppThemes.getTextTheme()
              .bodyText1
              ?.copyWith(fontWeight: FontWeight.w400, fontSize: 12),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class SuggestedStationsView extends StatelessWidget {
  final List<StationObject> stations;
  final ValueChanged<StationObject> onChanged;

  const SuggestedStationsView(
      {Key? key, required this.stations, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8),
      children: [
        ...stations
            .map((e) => MyStationCardItemView(
                  stationObject: e,
                  onTap: () => onChanged.call(e),
                ))
            .toList(),
      ],
    );
  }
}
