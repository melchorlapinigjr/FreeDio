abstract class PreferencesService {
  Future<void> updateRecentStations(List<String> ids);

  Future<List<String>> getRecentStations();

  Future<void> updateFavorites(List<String> ids);

  Future<List<String>> getFavorites();
}
