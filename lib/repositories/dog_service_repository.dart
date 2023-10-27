import 'package:dog_finder/common/apis/dog_service_api.dart';
import 'package:dog_finder/common/models/dog_breed.dart';
import 'package:dog_finder/common/models/dog_image.dart';
import 'package:dog_finder/common/models/dog_sub_breed.dart';
import 'package:dog_finder/screens/main/widgets/flutter_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../constants/constants.dart';
import '../constants/enums/status.dart';
import '../controllers/dog_service_cubit/dog_service_cubit.dart';

class DogServiceRepository {
  final BuildContext context;

  DogServiceRepository({required this.context});

  // fetch dog breeds
  Future<void> fetchDogBreeds() async {
    EasyLoading.show();
    try {
      var response = await DogServiceAPI.fetchDogBreeds();
      if (response.status == 'success') {
        EasyLoading.dismiss();
        populateDogBreedList(dogBreedList: response.message);
      } else {
        EasyLoading.dismiss();
        toastInfo(
          msg: 'An error occurred! ${response.status}',
          status: Status.error,
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      toastInfo(
        msg: AppConstants.errorOccurredStatement,
        status: Status.error,
      );
    }
  }

  // populate Dog Breed
  void populateDogBreedList({required List<DogBreed> dogBreedList}) {
    context.read<DogServiceCubit>().setDogBreedList(dogBreedList: dogBreedList);
  }

  // fetch sub dog breeds
  Future<void> fetchDogSubBreeds() async {
    DogBreed dogBreed = context.read<DogServiceCubit>().state.currentBreed;

    EasyLoading.show();
    try {
      var response = await DogServiceAPI.fetchDogSubBreeds(
        dogBreed: dogBreed.name!,
      );
      if (response.status == AppConstants.APISuccess) {
        EasyLoading.dismiss();
        if (response.message.isNotEmpty) {
          populateSubDogBreedList(
            dogSubBreedList: response.message,
          );
          setCurrentDogSubBreed(
            dogSubBreed: DogSubBreed(
              name: response.message.first.name!,
            ),
          );

          if (kDebugMode) {
            print("The First Sub Breed: ${response.message.first.name!}");
          }
        } else {
          toastInfo(
            msg: 'Ops! Dog breed has no sub breeds',
            status: Status.error,
          );

          // set the current sub breed as no sub breed
          setCurrentDogSubBreed(
            dogSubBreed: const DogSubBreed(
              name: AppConstants.emptySubBread,
            ),
          );

          // set the sub breed list to empty
          populateSubDogBreedList(
            dogSubBreedList: [
              const DogSubBreed(
                name: AppConstants.emptySubBread,
              )
            ],
          );
        }
      } else {
        EasyLoading.dismiss();
        toastInfo(
          msg: 'An error occurred! ${response.status}',
          status: Status.error,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error $e}");
      }
      EasyLoading.dismiss();
      toastInfo(
        msg: AppConstants.errorOccurredStatement,
        status: Status.error,
      );
    }
  }

  // populate Dog Sub Breed
  void populateSubDogBreedList({required List<DogSubBreed> dogSubBreedList}) {
    context
        .read<DogServiceCubit>()
        .setDogSubBreedList(dogSubBreedList: dogSubBreedList);
  }

  // set current dog Sub Breed
  void setCurrentDogSubBreed({required DogSubBreed dogSubBreed}) {
    context
        .read<DogServiceCubit>()
        .setCurrentDogSubBreed(dogSubBreed: dogSubBreed);
  }

  // fetch dog breed random image
  Future<void> fetchDogBreedRandomImage() async {
    DogBreed dogBreed = context.read<DogServiceCubit>().state.currentBreed;
    EasyLoading.show();

    try {
      var response = await DogServiceAPI.fetchRandomDogBreedImage(
          dogBreed: dogBreed.name!);
      if (response.status == AppConstants.APISuccess) {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print("The Random Image is ${response.message}");
        }
        populateDogBreedRandomImage(
          randomDogBreedImage: response.message.message,
        );
      } else {
        EasyLoading.dismiss();
        toastInfo(
          msg: 'An error occurred! ${response.status}',
          status: Status.error,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("An error from random image $e");
      }
      EasyLoading.dismiss();
      toastInfo(
        msg: AppConstants.errorOccurredStatement,
        status: Status.error,
      );
    }
  }

  // set dog breed random image
  void populateDogBreedRandomImage({
    required String randomDogBreedImage,
  }) {
    context.read<DogServiceCubit>().setRandomDogBreedImage(
          randomDogBreedImage: randomDogBreedImage,
        );
  }

  // fetch dog breed image list
  Future<void> fetchDogBreedImageList() async {
    DogBreed dogBreed = context.read<DogServiceCubit>().state.currentBreed;
    EasyLoading.show();

    try {
      var response =
          await DogServiceAPI.fetchBreedImageList(dogBreed: dogBreed.name!);
      if (response.status == AppConstants.APISuccess) {
        EasyLoading.dismiss();
        populateDogBreedImageList(
          dogBreedImageList: response.message,
        );
      } else {
        EasyLoading.dismiss();
        toastInfo(
          msg: 'An error occurred! ${response.status}',
          status: Status.error,
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      toastInfo(
        msg: AppConstants.errorOccurredStatement,
        status: Status.error,
      );
    }
  }

  // set dog breed random image list
  void populateDogBreedImageList({
    required List<DogImageItem> dogBreedImageList,
  }) {
    context.read<DogServiceCubit>().setDogBreedImageList(
          dogBreedImageList: dogBreedImageList,
        );
  }

  // fetch dog breed sub breed random image
  Future<void> fetchDogBreedSubBreedRandomImage() async {
    String dogSubBreed =
        context.read<DogServiceCubit>().state.currentSubBreed.name!;
    String dogBreed = context.read<DogServiceCubit>().state.currentBreed.name!;
    EasyLoading.show();

    try {
      var response = await DogServiceAPI.fetchBreedSubBreadRandomImage(
        dogBreed: dogBreed,
        dogSubBreed: dogSubBreed,
      );
      if (response.status == AppConstants.APISuccess) {
        EasyLoading.dismiss();
        if (response.message.message.isNotEmpty) {
          populateDogBreedSubBreedRandomImage(
            randomDogSubBreedImage: response.message,
          );
        } else {
          toastInfo(
            msg: 'Dog breed has no sub breed images',
            status: Status.error,
          );
        }

        if (kDebugMode) {
          print("Sub Breed Image: ${response.message}");
        }
      } else {
        EasyLoading.dismiss();
        toastInfo(
          msg: 'An error occurred! ${response.status}',
          status: Status.error,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred [RANDOM SUB BREED IMAGE]! $e');
      }
      EasyLoading.dismiss();
      toastInfo(
        msg: AppConstants.errorOccurredStatement,
        status: Status.error,
      );
    }
  }

  // set dog breed random image
  void populateDogBreedSubBreedRandomImage({
    required DogImageItem randomDogSubBreedImage,
  }) {
    context.read<DogServiceCubit>().setRandomDogSubBreedImage(
          randomDogSubBreedImage: randomDogSubBreedImage.message,
        );
  }

  // fetch dog breed sub breed image list
  Future<void> fetchDogBreedSubBreedImageList() async {
    String dogSubBreed =
        context.read<DogServiceCubit>().state.currentSubBreed.name!;
    String dogBreed = context.read<DogServiceCubit>().state.currentBreed.name!;
    EasyLoading.show();

    try {
      var response = await DogServiceAPI.fetchBreedSubBreadImageList(
        dogBreed: dogBreed,
        dogSubBreed: dogSubBreed,
      );
      if (response.status == AppConstants.APISuccess) {
        EasyLoading.dismiss();
        if (response.message.isNotEmpty) {
          populateDogBreedSubBreedImageList(
            dogSubBreedImageList: response.message,
          );
        } else {
          toastInfo(
            msg: 'Ops! Dog breed has no sub breed images',
            status: Status.error,
          );
        }
      } else {
        EasyLoading.dismiss();
        toastInfo(
          msg: 'An error occurred! ${response.status}',
          status: Status.error,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred [ SUB BREED IMAGES]! $e');
      }
      EasyLoading.dismiss();
      toastInfo(
        msg: AppConstants.errorOccurredStatement,
        status: Status.error,
      );
    }
  }

  // set dog breed random image list
  void populateDogBreedSubBreedImageList({
    required List<DogImageItem> dogSubBreedImageList,
  }) {
    context.read<DogServiceCubit>().setDogSubBreedImageList(
          dogSubBreedImageList: dogSubBreedImageList,
        );
  }
}
