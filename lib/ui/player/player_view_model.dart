import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:free_radio_philippines/app/app_base_view_model.dart';
import 'package:free_radio_philippines/core/models/station_data_object.dart';
import 'package:free_radio_philippines/core/models/station_object.dart';
import 'package:free_radio_philippines/main.dart';

class PlayerViewModel extends AppBaseViewModel {
  StationObject? stationObject;
  final AssetsAudioPlayer player;

  PlayerViewModel(this.stationObject, this.player);

  StationDataObject? stationDataObject;
  bool isInFavorites = false;
  bool isBuffering = false;
  bool isPlaying = false;

  void init() async {
    setBusy(true);
    await stopPlayer();
    stationDataObject = await apiService.getStationData(stationObject!.url!);
    playRadio();
    listenToPlayerBuffer();
    listenToPlayerState();
    checkIfIsInFavorites();
    setBusy(false);
    addStationToRecent();
  }

  void addStationToRecent() async {
    final stations = await prefService.getRecentStations();
    if (!stations.contains(stationObject!.url!)) {
      stations.add(stationObject!.url!);
      prefService.updateRecentStations(stations);
    }
  }

  void addOrRemoveToFavorites() async {
    final stations = await prefService.getFavorites();
    if (!stations.contains(stationObject!.url!)) {
      stations.add(stationObject!.url!);
      prefService.updateFavorites(stations);
      isInFavorites = true;
    } else {
      stations.remove(stationObject!.url!);
      prefService.updateFavorites(stations);
      isInFavorites = false;
    }
    notifyListeners();
  }

  void checkIfIsInFavorites() async {
    final stations = await prefService.getFavorites();
    isInFavorites = stations.contains(stationObject!.url!);
    notifyListeners();
  }

  Future<void> stopPlayer() async {
    await player.stop().then((value) => logger.d('Player stopped.'));
  }

  void listenToPlayerState() {
    player.isPlaying.listen((event) {
      isPlaying = event;
      notifyListeners();
    });
  }

  void listenToPlayerBuffer() {
    isBuffering = true;
    notifyListeners();
    player.isBuffering.listen((event) {
      isBuffering = event;
      notifyListeners();
    });
  }

  void playOrPause() async {
    await player.playOrPause();
  }

  void playRadio() async {
    try {
      isBuffering = true;
      notifyListeners();
      await stopPlayer();

      if (stationDataObject != null &&
          stationDataObject!.data.streams.isNotEmpty) {
        String url = stationDataObject!.data.streams.first.url;
        if (url.contains('https://') && url.contains('http://')) {
          url = 'http://${url.split('http://').last}';
        }
        if (url.contains('https://vobook.ru/')) {
          url = url.replaceAll('https://vobook.ru/', '');
        }

        logger.d(url);
        player.open(Audio.liveStream(url)).then((value) {
          isBuffering = false;
          notifyListeners();
        }).catchError((error) {
          snackBarService.showSnackBar(
              'Unable to play radio station. Please try again or select another station.');
        });
        player.currentPosition.listen((event) {
          isBuffering = false;
          notifyListeners();
        });
      }
    } catch (e) {
      snackBarService.showSnackBar('Unable to play radios station.');
    }
  }

  void onChangedStation(StationObject stationObject) {
    this.stationObject = stationObject;
    init();
  }

  void onBackPressed() {
    navigationService.pop();
  }
}
