import 'package:dog_finder/common/app_bloc_repositories/app_bloc_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/app_bloc_providers/app_bloc_providers.dart';
import 'common/pages/pages.dart';
import 'common/theme/app_theme.dart';
import 'global_config/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const DogFinder());
}

class DogFinder extends StatelessWidget {
  const DogFinder({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    EasyLoading.instance
      ..dismissOnTap = false
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..animationDuration = const Duration(milliseconds: 50)
      ..loadingStyle = EasyLoadingStyle.light;

    return MultiRepositoryProvider(
      providers: AppBlocRepositories.allBlocRepositories,
      child: MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getTheme(),
            builder: EasyLoading.init(),
            onGenerateRoute: AppPages.generateRoute,
          ),
        ),
      ),
    );
  }
}