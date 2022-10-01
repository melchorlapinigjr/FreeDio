// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../core/services/api/api_services.dart';
import '../core/services/api/api_services_impl.dart';
import '../core/services/bottom_sheet/bottom_sheet_service.dart';
import '../core/services/bottom_sheet/bottom_sheet_service_impl.dart';
import '../core/services/dialog/dialog_service.dart';
import '../core/services/dialog/dialog_service_impl.dart';
import '../core/services/navigation/navigation_service.dart';
import '../core/services/navigation/navigation_service_impl.dart';
import '../core/services/preference/preferences_service.dart';
import '../core/services/preference/preferences_service_impl.dart';
import '../core/services/snack_bar/snack_bar_service.dart';
import '../core/services/snack_bar/snack_bar_service_impl.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerSingleton<NavigationService>(NavigationServiceImpl());
  locator.registerLazySingleton<SnackBarService>(() => SnackBarServiceImpl());
  locator.registerLazySingleton<PreferencesService>(
      () => PreferencesServiceImpl());
  locator.registerLazySingleton<BottomSheetService>(
      () => BottomSheetServiceImpl());
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());
  locator.registerLazySingleton<DialogService>(() => DialogServiceImpl());
}
