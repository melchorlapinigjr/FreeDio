// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../core/models/station_object.dart';
import '../ui/main_page/main_page_view.dart';
import '../ui/player/player_view.dart';

class Routes {
  static const String MainPageView = '/';
  static const String PlayerView = '/player-view';
  static const all = <String>{
    MainPageView,
    PlayerView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.MainPageView, page: MainPageView),
    RouteDef(Routes.PlayerView, page: PlayerView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainPageView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MainPageView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    PlayerView: (data) {
      var args = data.getArgs<PlayerViewArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => PlayerView(
          key: args.key,
          stationObject: args.stationObject,
          player: args.player,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideRightWithFade,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// PlayerView arguments holder class
class PlayerViewArguments {
  final Key? key;
  final StationObject stationObject;
  final AssetsAudioPlayer player;
  PlayerViewArguments(
      {this.key, required this.stationObject, required this.player});
}
