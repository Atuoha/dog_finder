// show bottom modal
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../components/breed_drop_down.dart';

Future<void> showBreedBottomSheet({
  required BuildContext context,
  bool isSubBreedScreen = false,
}) async {
  await showModalBottomSheet(
    backgroundColor: AppColors.primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Selected Breed:',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          DogBreedDropDownButton(
            isSubBreedScreen: isSubBreedScreen,
          )
        ],
      ),
    ),
  );
}
