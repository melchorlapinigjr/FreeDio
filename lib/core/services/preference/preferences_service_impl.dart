import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'pref_keys.dart';
import 'preferences_service.dart';

class PreferencesServiceImpl extends PreferencesService {
  @override
  Future<void> updateRecentStations(List<String> ids) async {
    final pref = await SharedPreferences.getInstance();
    final encodedFile = json.encode(ids);
    pref.setString(PrefKeys.recentStations, encodedFile);
    return;
  }

  @override
  Future<void> updateFavorites(List<String> ids) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.favoriteStations, json.encode(ids));
    return;
  }

  @override
  Future<List<String>> getRecentStations() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString(PrefKeys.recentStations);
    if (data == null) {
      return [];
    }
    final jsonData = json.decode(data);
    List<String> stations = [];
    for (final item in jsonData) {
      stations.add(item.toString());
    }
    return stations;
  }

  @override
  Future<List<String>> getFavorites() async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getString(PrefKeys.favoriteStations);
    if (data == null) {
      return [];
    }
    final jsonData = json.decode(data);
    List<String> stations = [];
    for (final item in jsonData) {
      stations.add(item.toString());
    }
    return stations;
  }
}
