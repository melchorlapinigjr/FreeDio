import 'package:flutter/material.dart';
import 'package:free_radio_philippines/app/app.router.dart';
import 'package:free_radio_philippines/app/app_base_view_model.dart';
import 'package:free_radio_philippines/core/models/station_object.dart';

class MyGridViewModel extends AppBaseViewModel {
  final Map<String, dynamic> allStations;
  late List<StationObject> stations = [];

  MyGridViewModel({required this.allStations});

  void init([bool isRecentStations = true]) async {
    setBusy(true);
    List<String> stationsIds = [];
    if (isRecentStations) {
      stationsIds = await prefService.getRecentStations();
    } else {
      stationsIds = await prefService.getFavorites();
    }
    if (stationsIds.isNotEmpty) {
      stations = getStationsUsingIds(stationsIds);
    }
    setBusy(false);
  }

  List<StationObject> getStationsUsingIds(List<String> ids) {
    List<StationObject> stations = [];
    for (final id in ids) {
      final StationObject? station = allStations[id];
      if (station != null) {
        stations.add(station);
      }
    }

    return stations;
  }

  void onStationPressed(StationObject object) {
    navigationService.pushNamed(Routes.PlayerView,
        arguments: PlayerViewArguments(stationObject: object, player: player));
  }
}
