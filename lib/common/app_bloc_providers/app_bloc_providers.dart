import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dog_finder/controllers/carousel_slider/carousel_slider_cubit.dart';
import 'package:dog_finder/repositories/dog_service_repository.dart';
import '../../controllers/dog_service_cubit/dog_service_cubit.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        // carousel cubit
        BlocProvider(
          create: (context) => CarouselSliderCubit(),
        ),

        // dog service cubit
        BlocProvider(
          create: (context) => DogServiceCubit(
            dogServiceRepository: context.read<DogServiceRepository>(),
          ),
        ),
      ];
}


