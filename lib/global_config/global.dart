import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/services/storage_service.dart';
import '../common/utils/app_bloc_observer.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    // Bloc.observer = AppBlocObserver();

    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageService().init();
  }
}
