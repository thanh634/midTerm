import 'package:flutter/material.dart';


class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // A callback to track the current route
  static String? currentRoute;

  // Add a CustomRouteObserver to track route changes
  static final CustomRouteObserver routeObserver = CustomRouteObserver((newRouteName) {
    currentRoute = newRouteName; // Keep track of the current route
    print("Current Route: $currentRoute"); // Debugging/logging
  });

  static Future<dynamic> pushNamed(
      String routeName, {
        dynamic arguments,
      }) async {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
      String routeName, {
        bool routePredicate = false,
        dynamic arguments,
      }) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => routePredicate, arguments: arguments);
  }

  static Future<dynamic> popAndPushNamed(
      String routeName, {
        dynamic arguments,
      }) async {
    return navigatorKey.currentState?.popAndPushNamed(routeName, arguments: arguments);
  }
}

class CustomRouteObserver extends NavigatorObserver {
  final Function(String? currentRouteName) onRouteChange;

  CustomRouteObserver(this.onRouteChange);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      onRouteChange(route.settings.name);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute?.settings.name != null) {
      onRouteChange(previousRoute!.settings.name);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute?.settings.name != null) {
      onRouteChange(newRoute!.settings.name);
    }
  }
}
