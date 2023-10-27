

import 'package:dog_finder/screens/main/home.dart';

import '../../screens/main/main_entry.dart';
import '../../screens/splash/entry_screen.dart';
import '../../screens/splash/splash_screen.dart';

class AppRoutes {
  static const String entryScreen = '/';
  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';
  static const String errorScreen = '/errorScreen';
}

final routes = {
  AppRoutes.entryScreen: (context) => const EntryScreen(),
  AppRoutes.splashScreen: (context) => const SplashScreen(),
  AppRoutes.homeScreen: (context) => const MainEntryScreen(),

};
