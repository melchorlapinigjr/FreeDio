import 'dart:async';

import 'package:dio/dio.dart';
import 'package:free_radio_philippines/core/models/station_data_object.dart';

import 'package:free_radio_philippines/core/models/station_object.dart';
import 'package:free_radio_philippines/ui/common/constants.dart';

import 'api_services.dart';

class ApiServiceImpl extends ApiService {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: Constants.baseUrl,
    contentType: Constants.contentType,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
  final Dio dio = Dio(baseOptions);

  @override
  Future<List<StationObject>> getStations() async {
    List<StationObject> list = [];
    await dio.get('/radios').then((value) {
      final Iterable stationList = value.data['data'];
      for (var item in stationList) {
        list.add(StationObject.fromJson(item));
      }
    });

    return list;
  }

  @override
  Future<StationDataObject?> getStationData(String stationUrl) async {
    StationDataObject? stationDataObject;
    final response = await dio.get('/slugs/$stationUrl');
    stationDataObject =
        StationDataObject.fromJson(response.data as Map<String, dynamic>);

    return stationDataObject;
  }
}
