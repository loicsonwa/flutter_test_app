import 'package:flutter/material.dart';
import 'package:flutter_test_app/views/screens/details/detail_screen.dart';
import 'package:flutter_test_app/views/screens/home/home_screen.dart';
import 'package:flutter_test_app/views/screens/splash/splash_screen.dart';
import 'routes.dart';

class AppRouter {
  /// Add entry for new route here
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.SPLASH:
        return MaterialPageRoute(
            settings: RouteSettings(arguments: args, name: Routes.SPLASH),
            builder: (_) {
              return const SplashScreen();
            });
      case Routes.HOME:
        return MaterialPageRoute(
            settings: RouteSettings(arguments: args, name: Routes.HOME),
            builder: (_) {
              return const HomeScreen();
            });
      case Routes.DETAIL_PAGE:
        return MaterialPageRoute(
            settings: RouteSettings(arguments: args, name: Routes.DETAIL_PAGE),
            builder: (_) {
              final detailsArgs = args as DetailScreenArgs;
              return DetailScreen(
                selectedItem: detailsArgs.selectedItem,
              );
            });
      // Default case, should not reach here.
      default:
        return null;
    }
  }
}
