import 'package:bloc/bloc.dart';
import 'package:dog_finder/common/models/dog_sub_breed.dart';
import 'package:equatable/equatable.dart';

import '../../common/models/dog_breed.dart';
import '../../common/models/dog_image.dart';
import '../../constants/constants.dart';
import '../../constants/enums/processing_status.dart';
import '../../repositories/dog_service_repository.dart';

part 'dog_service_state.dart';

class DogServiceCubit extends Cubit<DogServiceState> {
  final DogServiceRepository dogServiceRepository;

  DogServiceCubit({required this.dogServiceRepository})
      : super(DogServiceState.initial());

  // current dog breed
  void setCurrentDogBreed({required DogBreed dogBreed}) {
    emit(state.copyWith(
      currentBreed: dogBreed,
      processingStatus: ProcessingStatus.success,
    ));
  }

  // current dog sub breed
  void setCurrentDogSubBreed({required DogSubBreed dogSubBreed}) {
    emit(state.copyWith(
      currentSubBreed: dogSubBreed,
      processingStatus: ProcessingStatus.success,
    ));
  }

  // dog breed list
  void setDogBreedList({required List<DogBreed> dogBreedList}) async {
    emit(state.copyWith(
      dogBreedsList: dogBreedList,
      processingStatus: ProcessingStatus.success,
    ));
  }

  // dog sub breed list
  void setDogSubBreedList({required List<DogSubBreed> dogSubBreedList}) {
    emit(state.copyWith(
      dogSubBreedsList: dogSubBreedList,
      processingStatus: ProcessingStatus.success,
    ));
  }

  // dog breed image list
  void setDogBreedImageList({required List<DogImageItem> dogBreedImageList}) {
    emit(state.copyWith(
      dogBreedImagesList: dogBreedImageList,
      processingStatus: ProcessingStatus.success,
    ));
  }

  // dog sub breed image list
  void setDogSubBreedImageList({required List<DogImageItem> dogSubBreedImageList}) {
    emit(state.copyWith(
      dogSubBreedImagesList: dogSubBreedImageList,
      processingStatus: ProcessingStatus.success,
    ));
  }

  // random dog breed
  void setRandomDogBreedImage({required String randomDogBreedImage}) {
    emit(state.copyWith(
      randomDogBreedImage: randomDogBreedImage,
      processingStatus: ProcessingStatus.success,
    ));
  }

  // fetch random dog breed image
  Future<void> fetchRandomDogBreadImage() async {
    await dogServiceRepository.fetchDogBreedRandomImage();
  }

  // random dog sub breed
  void setRandomDogSubBreedImage({required String randomDogSubBreedImage}) {
    emit(state.copyWith(
      randomDogSubBreedImage: randomDogSubBreedImage,
      processingStatus: ProcessingStatus.success,
    ));
  }
}
