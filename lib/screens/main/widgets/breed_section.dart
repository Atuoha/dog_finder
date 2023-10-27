import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/app_colors.dart';
import '../../../controllers/dog_service_cubit/dog_service_cubit.dart';
import 'dog_breed_bottom_sheet.dart';

class BreedSection extends StatelessWidget {
  const BreedSection({
    super.key,
    required this.dogServiceWatch,
  });

  final DogServiceCubit dogServiceWatch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondaryColor,
      ),
      child: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              'Selected Breed:',
              style: getLightStyle(
                  color: Colors.white, fontSize: FontSize.s14),
            ),
            const SizedBox(width: 20),
            Text(
              dogServiceWatch.state.currentBreed.name!.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getBoldStyle(
                  color: Colors.white, fontSize: FontSize.s16),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () => showBreedBottomSheet(context: context),
              child: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
