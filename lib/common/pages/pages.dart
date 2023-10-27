import 'package:dog_finder/screens/splash/entry_screen.dart';
import 'package:dog_finder/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../global_config/global.dart';
import '../../screens/main/error_page.dart';
import '../../screens/main/main_entry.dart';
import '../routes/app_routes.dart';

class AppPages {
  static List<PageEntity> routes() => [
        // entry screen
        PageEntity(
          route: AppRoutes.entryScreen,
          page: const EntryScreen(),
        ),

        // splash screen
        PageEntity(
          route: AppRoutes.splashScreen,
          page: const SplashScreen(),
        ),

        // main screen
        PageEntity(
          route: AppRoutes.homeScreen,
          page: const MainEntryScreen(),
        ),
      ];

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    if (routeSettings.name != null) {
      // check if routeSettings is available in routes
      var result =
          routes().where((element) => element.route == routeSettings.name);

      if (result.isNotEmpty) {
        bool isAppPreviouslyRan =
            Global.storageService.getBoolValue(AppConstants.isAppPreviouslyRan);

        if (result.first.route == AppRoutes.entryScreen && isAppPreviouslyRan) {
          return MaterialPageRoute(
            builder: (_) => const MainEntryScreen(),
            settings: routeSettings,
          );
        }
      }

      return MaterialPageRoute(
        builder: (_) => result.first.page,
        settings: routeSettings,
      );
    }

    print('Unknown route name');
    return MaterialPageRoute(
      builder: (_) => const ErrorScreen(),
      settings: routeSettings,
    );
  }
}

class PageEntity {
  final String route;
  final Widget page;
  final dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
