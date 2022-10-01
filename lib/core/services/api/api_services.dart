import 'package:free_radio_philippines/core/models/station_object.dart';
import 'package:free_radio_philippines/core/models/station_data_object.dart';

abstract class ApiService {
  Future<List<StationObject>> getStations();

  Future<StationDataObject?> getStationData(String stationUrl);
}
