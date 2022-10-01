import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:free_radio_philippines/app/app.router.dart';
import 'package:free_radio_philippines/app/app_base_view_model.dart';
import 'package:free_radio_philippines/core/models/station_object.dart';
import 'package:free_radio_philippines/main.dart';

class MainPageViewModel extends AppBaseViewModel {
  List<StationObject> stations = [];
  final double headerSize = 240;
  final AssetsAudioPlayer player = AssetsAudioPlayer();

  late TabController tabController;
  int currentIndex = 0;

  void init(mainPageViewState) async {
    setBusy(true);
    tabController = TabController(length: 4, vsync: mainPageViewState);
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
      stations = await apiService.getStations();
    } catch (e) {
      logger.d(e);
    }
  }

  void onStationPressed(StationObject object) {
    navigationService.pushNamed(Routes.PlayerView,
        arguments: PlayerViewArguments(stationObject: object, player: player));
  }
}
