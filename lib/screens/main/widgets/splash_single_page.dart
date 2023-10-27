
// page
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget singleSplashPage({
  required String imgUrl,
  required String title,
  required String description,
}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(imgUrl),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp),
        ),
        const SizedBox(height: 20),
      ],
    );
