import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_finder/repositories/dog_service_repository.dart';

class AppBlocRepositories {
  static get allBlocRepositories => [
        // dog service repo
        RepositoryProvider(
          create: (context) => DogServiceRepository(context: context),
        ),
      ];
}
