import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../gen/assets.gen.dart';

class CarouselSliderItem {
  final int id;
  final String title;
  final String subtitle;
  final AssetGenImage imgUrl;
  final Color backgroundColor;

  CarouselSliderItem({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
  });


}

final List<CarouselSliderItem> carouselSliderItems = [
  CarouselSliderItem(
    id: 1,
    imgUrl: Assets.images.carouselImg1,
    title: 'Lorem Ipsum De ta',
    subtitle: 'ipsum loream data',
    backgroundColor: AppColors.carouselImage1Color,
  ),
  CarouselSliderItem(
    id: 1,
    imgUrl: Assets.images.carouselImg2,
    title: 'Ipsum Tafua Laradae',
    subtitle: 'lorem ipsum taf vae',
    backgroundColor:AppColors.carouselImage2Color,
  ),
  CarouselSliderItem(
    id: 2,
    imgUrl: Assets.images.carouselImg3,
    title: 'Yanwa Ipsum Lorem',
    subtitle: 'nawad lorem uade',
    backgroundColor: AppColors.carouselImage3Color,
  ),

];
