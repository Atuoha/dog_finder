part of 'dog_service_cubit.dart';

class DogServiceState extends Equatable {
  final DogBreed currentBreed;
  final DogSubBreed currentSubBreed;
  final String randomDogBreedImage;
  final String randomDogSubBreedImage;
  final List<DogBreed> dogBreedsList;
  final List<DogSubBreed> dogSubBreedsList;
  final List<DogImageItem> dogBreedImagesList;
  final List<DogImageItem> dogSubBreedImagesList;
  final ProcessingStatus processingStatus;

  const DogServiceState({
    required this.currentBreed,
    required this.dogBreedsList,
    required this.dogBreedImagesList,
    required this.dogSubBreedImagesList,
    required this.randomDogBreedImage,
    required this.randomDogSubBreedImage,
    required this.currentSubBreed,
    required this.dogSubBreedsList,
    required this.processingStatus,
  });

  factory DogServiceState.initial() => const DogServiceState(
        currentBreed: DogBreed(name: AppConstants.defaultBreed),
        currentSubBreed: DogSubBreed(name: AppConstants.defaultSubBreed),
        dogBreedsList: [],
        dogSubBreedsList: [],
        dogBreedImagesList: [],
        dogSubBreedImagesList: [],
        randomDogBreedImage: "",
        randomDogSubBreedImage: "",
        processingStatus: ProcessingStatus.initial,
      );

  @override
  List<Object> get props => [
        currentBreed,
        dogBreedsList,
        dogBreedImagesList,
        dogSubBreedImagesList,
        randomDogBreedImage,
        randomDogSubBreedImage,
        currentSubBreed,
        dogSubBreedsList,
        processingStatus,
      ];

  DogServiceState copyWith({
    DogBreed? currentBreed,
    DogSubBreed? currentSubBreed,
    String? randomDogBreedImage,
    String? randomDogSubBreedImage,
    List<DogBreed>? dogBreedsList,
    List<DogSubBreed>? dogSubBreedsList,
    List<DogImageItem>? dogBreedImagesList,
    List<DogImageItem>? dogSubBreedImagesList,
    ProcessingStatus? processingStatus,
  }) {
    return DogServiceState(
      currentBreed: currentBreed ?? this.currentBreed,
      currentSubBreed: currentSubBreed ?? this.currentSubBreed,
      randomDogBreedImage: randomDogBreedImage ?? this.randomDogBreedImage,
      randomDogSubBreedImage:
          randomDogSubBreedImage ?? this.randomDogSubBreedImage,
      dogBreedsList: dogBreedsList ?? this.dogBreedsList,
      dogSubBreedsList: dogSubBreedsList ?? this.dogSubBreedsList,
      dogBreedImagesList: dogBreedImagesList ?? this.dogBreedImagesList,
      dogSubBreedImagesList:
          dogSubBreedImagesList ?? this.dogSubBreedImagesList,
      processingStatus: processingStatus ?? this.processingStatus,
    );
  }
}
