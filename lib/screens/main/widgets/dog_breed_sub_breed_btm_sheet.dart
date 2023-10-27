// show bottom modal
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../components/sub_breed_down.dart';

Future<void> showSubBreedBottomSheet({required BuildContext context}) async {
  await showModalBottomSheet(
    backgroundColor: AppColors.primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) =>  const Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Selected Sub Breed:',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          DogSubBreedDropDownButton()
        ],
      ),
    ),
  );
}