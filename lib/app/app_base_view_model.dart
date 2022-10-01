import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/widgets.dart';
import 'package:free_radio_philippines/core/services/api/api_services.dart';
import 'package:free_radio_philippines/core/services/bottom_sheet/bottom_sheet_service.dart';
import 'package:free_radio_philippines/core/services/dialog/dialog_service.dart';
import 'package:free_radio_philippines/core/services/navigation/navigation_service.dart';
import 'package:free_radio_philippines/core/services/preference/preferences_service.dart';
import 'package:free_radio_philippines/core/services/snack_bar/snack_bar_service.dart';
import 'package:stacked/stacked.dart';

import 'app.locator.dart';

class AppBaseViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackBarService>();
  final prefService = locator<PreferencesService>();
  final bottomSheetServices = locator<BottomSheetService>();
  final apiService = locator<ApiService>();
  final dialogService = locator<DialogService>();

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
