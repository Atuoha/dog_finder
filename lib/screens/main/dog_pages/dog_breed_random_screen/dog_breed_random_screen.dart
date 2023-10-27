import 'package:dog_finder/controllers/dog_service_cubit/dog_service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/app_colors.dart';
import '../../../../repositories/dog_service_repository.dart';
import '../../widgets/breed_section.dart';
import '../../widgets/k_cached_image.dart';

class DogBreedRandomScreen extends StatefulWidget {
  const DogBreedRandomScreen({super.key});

  @override
  State<DogBreedRandomScreen> createState() => _DogBreedRandomScreenState();
}

class _DogBreedRandomScreenState extends State<DogBreedRandomScreen> {
  late DogServiceRepository dogServiceRepository;

  @override
  void initState() {
    super.initState();
    dogServiceRepository = DogServiceRepository(context: context);
  }

  void fetchNewRandomDogBreedImage() {
    dogServiceRepository.fetchDogBreedRandomImage();
  }

  @override
  Widget build(BuildContext context) {
    final dogServiceWatch = context.watch<DogServiceCubit>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () => fetchNewRandomDogBreedImage(),
        child: const Icon(
          Icons.shuffle,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dog Breed Random Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            BreedSection(dogServiceWatch: dogServiceWatch),
            const SizedBox(height: 20),
            KCachedImage(
              image: dogServiceWatch.state.randomDogBreedImage,
              height: 250.h,
              width: 300.w,
            ),
          ],
        ),
      ),
    );
  }
}
