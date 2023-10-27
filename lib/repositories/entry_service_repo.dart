import 'package:flutter/cupertino.dart';
import 'dog_service_repository.dart';

class EntryServiceRepo {
  BuildContext context;

  EntryServiceRepo({required this.context});

  void init() {
    final DogServiceRepository dogServiceRepository =
        DogServiceRepository(context: context);

    dogServiceRepository.fetchDogBreeds(); // set breeds

    // set sub breeds
    dogServiceRepository.fetchDogSubBreeds();

    // fetch random dog breed image
    dogServiceRepository.fetchDogBreedRandomImage();

    // fetch breed image list
    dogServiceRepository.fetchDogBreedImageList();

    // fetch random dog breed sub breed image
    dogServiceRepository.fetchDogBreedSubBreedRandomImage();

    // fetch breed sub breed image list
    dogServiceRepository.fetchDogBreedSubBreedImageList();
  }
}
