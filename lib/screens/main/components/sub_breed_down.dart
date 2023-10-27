import 'package:dog_finder/common/models/dog_sub_breed.dart';
import 'package:dog_finder/controllers/dog_service_cubit/dog_service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/app_colors.dart';
import '../../../repositories/dog_service_repository.dart';

class DogSubBreedDropDownButton extends StatefulWidget {
  const DogSubBreedDropDownButton({Key? key}) : super(key: key);

  @override
  State<DogSubBreedDropDownButton> createState() =>
      _DogSubBreedDropDownButtonState();
}

class _DogSubBreedDropDownButtonState extends State<DogSubBreedDropDownButton> {
  late DogServiceRepository dogServiceRepository;

  // persisting changes
  void changeCurrentDogSubBreed({required DogSubBreed dogSubBreed}) {
    // set sub breeds
    context
        .read<DogServiceCubit>()
        .setCurrentDogSubBreed(dogSubBreed: dogSubBreed);

    // setting a new random breed sub breed image
    dogServiceRepository.fetchDogBreedSubBreedRandomImage();

    // setting a new breed sub breed image list
    dogServiceRepository.fetchDogBreedSubBreedImageList();
  }

  @override
  void initState() {
    super.initState();
    dogServiceRepository = DogServiceRepository(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> dogSubBreeds =
        context.read<DogServiceCubit>().state.dogSubBreedsList;

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
      value: context.watch<DogServiceCubit>().state.currentSubBreed.name,
      style: const TextStyle(color: Colors.white),
      dropdownColor: AppColors.primaryColor,
      iconEnabledColor: Colors.white,
      items: List<DropdownMenuItem>.generate(
        dogSubBreeds.length,
        (index) => DropdownMenuItem(
          value: dogSubBreeds[index].name,
          child: Text(dogSubBreeds[index].name),
        ),
      ).toList(),
      onChanged: (dogSubBreed) {
        changeCurrentDogSubBreed(
          dogSubBreed: DogSubBreed(name: dogSubBreed),
        );
      },
    );
  }
}
