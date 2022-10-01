import 'package:free_radio_philippines/app/app_base_view_model.dart';
import 'package:free_radio_philippines/core/services/api/api_services.dart';
import 'package:free_radio_philippines/core/services/api/api_services_impl.dart';
import 'package:free_radio_philippines/core/services/bottom_sheet/bottom_sheet_service.dart';
import 'package:free_radio_philippines/core/services/bottom_sheet/bottom_sheet_service_impl.dart';
import 'package:free_radio_philippines/core/services/dialog/dialog_service.dart';
import 'package:free_radio_philippines/core/services/dialog/dialog_service_impl.dart';
import 'package:free_radio_philippines/core/services/navigation/navigation_service.dart';
import 'package:free_radio_philippines/core/services/navigation/navigation_service_impl.dart';
import 'package:free_radio_philippines/core/services/preference/preferences_service.dart';
import 'package:free_radio_philippines/core/services/preference/preferences_service_impl.dart';
import 'package:free_radio_philippines/core/services/snack_bar/snack_bar_service.dart';
import 'package:free_radio_philippines/core/services/snack_bar/snack_bar_service_impl.dart';
import 'package:free_radio_philippines/ui/main_page/main_page_view.dart';
import 'package:free_radio_philippines/ui/player/player_view.dart';
import 'package:free_radio_philippines/ui/player/player_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  CustomRoute(
      page: MainPageView,
      initial: true,
      name: 'MainPageView',
      transitionsBuilder: TransitionsBuilders.fadeIn),
  CustomRoute(
      page: PlayerView,
      name: 'PlayerView',
      transitionsBuilder: TransitionsBuilders.slideRightWithFade),
], dependencies: [
  Singleton(classType: NavigationServiceImpl, asType: NavigationService),
  LazySingleton(classType: SnackBarServiceImpl, asType: SnackBarService),
  LazySingleton(classType: PreferencesServiceImpl, asType: PreferencesService),
  LazySingleton(classType: BottomSheetServiceImpl, asType: BottomSheetService),
  LazySingleton(classType: ApiServiceImpl, asType: ApiService),
  LazySingleton(classType: DialogServiceImpl, asType: DialogService),
])
class App {}
