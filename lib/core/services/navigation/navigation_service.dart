import 'package:flutter/widgets.dart'
    show GlobalKey, NavigatorState, RoutePredicate, required;

/// Service that is responsible for navigating around the app
abstract class NavigationService {
  GlobalKey<NavigatorState> get navigatorKey;

  Future<dynamic>? pushNamed(
    String routeName, {
    dynamic arguments,
    bool preventDuplicates = true,
  });

  Future<dynamic>? pushReplacementNamed(String routeName, {dynamic arguments});

  Future<dynamic>? popAllAndPushNamed(String routeName, {dynamic arguments});

  Future<dynamic>? popUntilFirstAndPushNamed(String routeName,
      {dynamic arguments});

  Future<dynamic>? pushNamedAndRemoveUntil(String routeName,
      {required RoutePredicate predicate, arguments, int? id});

  void popUntilNamed(String routeName);

  void popUntilPredicate(RoutePredicate routePredicate);

  void popRepeated(int times);

  bool pop({dynamic returnValue});

  String currentRoute();
}
