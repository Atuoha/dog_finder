import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/app_colors.dart';
import '../../../../controllers/dog_service_cubit/dog_service_cubit.dart';
import '../../../../repositories/dog_service_repository.dart';
import '../../widgets/breed_and_sub_breed_section.dart';
import '../../widgets/k_cached_image.dart';

class DogBreedSubBreedRandomScreen extends StatefulWidget {
  const DogBreedSubBreedRandomScreen({super.key});

  @override
  State<DogBreedSubBreedRandomScreen> createState() =>
      _DogBreedSubBreedRandomScreenState();
}

class _DogBreedSubBreedRandomScreenState
    extends State<DogBreedSubBreedRandomScreen> {
  late DogServiceRepository dogServiceRepository;

  @override
  void initState() {
    super.initState();
    dogServiceRepository = DogServiceRepository(context: context);
  }

  void fetchNewRandomDogBreedSubBreedImage() {
    dogServiceRepository.fetchDogBreedSubBreedRandomImage();
  }

  @override
  Widget build(BuildContext context) {
    final dogServiceWatch = context.watch<DogServiceCubit>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () => fetchNewRandomDogBreedSubBreedImage(),
        child: const Icon(
          Icons.shuffle,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dog Breed & Sub Breed Random Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            BreedAndSubBreedSection(dogServiceWatch: dogServiceWatch),
            const SizedBox(height: 20),
            KCachedImage(
              image: dogServiceWatch.state.randomDogSubBreedImage,
              height: 250.h,
              width: 300.w,
            ),
          ],
        ),
      ),
    );
  }
}
