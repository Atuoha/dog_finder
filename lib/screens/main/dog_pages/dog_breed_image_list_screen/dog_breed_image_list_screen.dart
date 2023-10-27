import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/dog_service_cubit/dog_service_cubit.dart';
import '../../components/image_list_grid_view.dart';
import '../../widgets/breed_section.dart';

class DogBreedImageListScreen extends StatefulWidget {
  const DogBreedImageListScreen({super.key});

  @override
  State<DogBreedImageListScreen> createState() =>
      _DogBreedImageListScreenState();
}

class _DogBreedImageListScreenState extends State<DogBreedImageListScreen> {
  @override
  Widget build(BuildContext context) {
    final dogServiceWatch = context.watch<DogServiceCubit>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dog Breed Image List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            BreedSection(dogServiceWatch: dogServiceWatch),
            const SizedBox(height: 20),
            ImageListGridView(
              imageItems: dogServiceWatch.state.dogBreedImagesList,
            )
          ],
        ),
      ),
    );
  }
}
