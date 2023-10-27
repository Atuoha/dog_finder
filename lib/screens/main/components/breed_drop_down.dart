import 'dart:async';
import 'package:dog_finder/controllers/dog_service_cubit/dog_service_cubit.dart';
import 'package:dog_finder/screens/main/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/models/dog_breed.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/enums/status.dart';
import '../../../repositories/dog_service_repository.dart';

class DogBreedDropDownButton extends StatefulWidget {
  const DogBreedDropDownButton({
    Key? key,
    this.isSubBreedScreen = false,
  }) : super(key: key);
  final bool isSubBreedScreen;

  @override
  State<DogBreedDropDownButton> createState() => _DogBreedDropDownButtonState();
}

class _DogBreedDropDownButtonState extends State<DogBreedDropDownButton> {
  late DogServiceRepository dogServiceRepository;

  // setting  current dog breed and setting sub breeds
  void changeCurrentDogBreed({required DogBreed dogBreed}) {
    // current breed
    context.read<DogServiceCubit>().setCurrentDogBreed(dogBreed: dogBreed);

    //setting fetching sub Breeds if present
    dogServiceRepository.fetchDogSubBreeds();

    // setting a new random breed image
    dogServiceRepository.fetchDogBreedRandomImage();

    // setting a new breed image list
    dogServiceRepository.fetchDogBreedImageList();

    // setting a timer so that the state and re-assigning sub breed contents
    if (widget.isSubBreedScreen) {
      Timer(const Duration(seconds: 5), () {
        if (context.read<DogServiceCubit>().state.currentSubBreed.name !=
            AppConstants.emptySubBread) {
          // Loading new contents
          toastInfo(msg: 'Loading new contents', status: Status.success);

          // setting a new random breed sub breed image
          dogServiceRepository.fetchDogBreedSubBreedRandomImage();

          // setting a new breed sub breed image list
          dogServiceRepository.fetchDogBreedSubBreedImageList();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dogServiceRepository = DogServiceRepository(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final List<DogBreed> dogBreeds =
        context.read<DogServiceCubit>().state.dogBreedsList;

    return DropdownButtonFormField(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      menuMaxHeight: 250,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      value: context.watch<DogServiceCubit>().state.currentBreed.name,
      style: const TextStyle(color: Colors.white),
      dropdownColor: AppColors.primaryColor,
      iconEnabledColor: Colors.white,
      items: List<DropdownMenuItem>.generate(
        dogBreeds.length,
        (index) => DropdownMenuItem(
          value: dogBreeds[index].name,
          child: Text(dogBreeds[index].name!),
        ),
      ).toList(),
      onChanged: (breed) {
        changeCurrentDogBreed(dogBreed: DogBreed(name: breed));
      },
    );
  }
}

//
