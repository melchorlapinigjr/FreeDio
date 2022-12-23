import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_radio_philippines/app/app.router.dart';
import 'package:free_radio_philippines/app/app_base_view_model.dart';
import 'package:free_radio_philippines/core/models/station_object.dart';
import 'package:free_radio_philippines/main.dart';

class MainPageViewModel extends AppBaseViewModel {
  List<StationObject> stations = [];
  final double headerSize = 240;
  Map<String, dynamic> mapOfStations = {};
  List<String> stationNames = [];
  Timer? timer;
  late TabController tabController;
  int currentIndex = 0;
  bool showSearchLoading = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void init(mainPageViewState) async {
    setBusy(true);
    tabController = TabController(length: 3, vsync: mainPageViewState);
    tabController.addListener(tabControllerIndexListener);
    await getData();
    setBusy(false);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void tabControllerIndexListener() {
    currentIndex = tabController.index;
    notifyListeners();
  }

  void setCurrentTabIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> getData() async {
    try {
      showSearchLoading = false;
      stations.clear();
      stations = await apiService.getStations();
      mapOfStations = Map.fromIterable(stations, key: (station) => station.url);
      stationNames = mapOfStations.keys.toList();
      notifyListeners();
    } catch (e) {
      logger.d(e);
    }
  }

  void onSearchTextChanged(value) {
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if ((value as String).isEmpty) {
        getData();
      } else {
        showSearchLoading = true;
        notifyListeners();
        final List<String> items = [];

        for (final item in stationNames) {
          if (item.contains(value)) {
            items.add(item);
          }
          getStationsUsingIds(items);
          showSearchLoading = false;
          notifyListeners();
        }
      }
      timer.cancel();
    });
  }

  List<StationObject> getStationsUsingIds(List<String> ids) {
    List<StationObject> newStations = [];
    for (final id in ids) {
      final StationObject? station = mapOfStations[id];
      if (station != null) {
        newStations.add(station);
      }
    }
    stations.clear();
    stations.addAll(newStations);
    notifyListeners();
    return stations;
  }

  void onStationPressed(StationObject object) {
    navigationService.pushNamed(Routes.PlayerView,
        arguments: PlayerViewArguments(stationObject: object, player: player));
  }

  void onRatePressed() {
    scaffoldKey.currentState?.closeDrawer();
    snackBarService
        .showSnackBar('Will be available on the next update. Thank you!');
  }

  void openMyDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
}
