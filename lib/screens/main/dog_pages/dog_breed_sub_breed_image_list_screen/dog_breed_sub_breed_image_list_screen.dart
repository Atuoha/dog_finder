import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/dog_service_cubit/dog_service_cubit.dart';
import '../../components/image_list_grid_view.dart';
import '../../widgets/breed_and_sub_breed_section.dart';

class DogBreedSubBreedImageListScreen extends StatefulWidget {
  const DogBreedSubBreedImageListScreen({super.key});

  @override
  State<DogBreedSubBreedImageListScreen> createState() =>
      _DogBreedSubBreedImageListScreenState();
}

class _DogBreedSubBreedImageListScreenState
    extends State<DogBreedSubBreedImageListScreen> {
  @override
  Widget build(BuildContext context) {
    final dogServiceWatch = context.watch<DogServiceCubit>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dog Breed & Sub Breed Image List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            BreedAndSubBreedSection(dogServiceWatch: dogServiceWatch),
            const SizedBox(height: 20),
            ImageListGridView(
              imageItems: dogServiceWatch.state.dogSubBreedImagesList,
            )
          ],
        ),
      ),
    );
  }
}

