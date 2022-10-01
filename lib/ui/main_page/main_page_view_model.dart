import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:free_radio_philippines/app/app.router.dart';
import 'package:free_radio_philippines/app/app_base_view_model.dart';
import 'package:free_radio_philippines/core/models/station_object.dart';
import 'package:free_radio_philippines/main.dart';

class MainPageViewModel extends AppBaseViewModel {
  List<StationObject> stations = [];

  final AssetsAudioPlayer player = AssetsAudioPlayer();

  void init() async {
    setBusy(true);
    await getData();
    setBusy(false);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
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
