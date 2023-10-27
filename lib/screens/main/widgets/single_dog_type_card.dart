import 'package:dog_finder/common/models/dog_type.dart';
import 'package:dog_finder/common/theme/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/theme/font_manager.dart';
import '../../../constants/app_colors.dart';
import '../../../gen/assets.gen.dart';

class SingleDogTypeCard extends StatelessWidget {
  const SingleDogTypeCard({super.key, required this.dogType});

  final DogType dogType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 250.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            Assets.images.dogWallapaper.path,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          dogType.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: getBoldStyle(
            color: AppColors.primaryThreeElementText,
            fontSize: FontSize.s16,
          ),
        ),
      ),
    );
  }
}
