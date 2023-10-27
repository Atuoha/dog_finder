import 'package:flutter/foundation.dart';

import '../models/dog_breed.dart';
import '../models/dog_breed_image_list.dart';
import '../models/dog_breed_random_image.dart';
import '../models/dog_breed_sub_breed_random_image.dart';
import '../models/dog_breed_sub_breed_image_list.dart';
import '../models/dog_sub_breed.dart';
import '../utils/http_util.dart';

class DogServiceAPI {
  // dog breed list
  static Future<DogBreedListResponseEntity> fetchDogBreeds() async {
    var response = await HttpUtil().get('breeds/list/all');
    if (kDebugMode) {
      print(response.toString());
    }
    return DogBreedListResponseEntity.fromJson(response);
  }

  // dog sub breed list
  static Future<DogSubBreedListResponseEntity> fetchDogSubBreeds({
    required String dogBreed,
  }) async {
    var response = await HttpUtil().get('breed/$dogBreed/list');
    if (kDebugMode) {
      print(response.toString());
    }
    return DogSubBreedListResponseEntity.fromJson(response);
  }

  // random breed image
  static Future<DogBreadRandomImageResponseEntity> fetchRandomDogBreedImage({
    required String dogBreed,
  }) async {
    var response = await HttpUtil().get('breed/$dogBreed/images/random');
    if (kDebugMode) {
      print(response.toString());
    }
    return DogBreadRandomImageResponseEntity.fromJson(response);
  }

  // dog breed image list
  static Future<DogBreedImageListResponseEntity> fetchBreedImageList({
    required String dogBreed,
  }) async {
    var response = await HttpUtil().get('breed/$dogBreed/images');
    if (kDebugMode) {
      print(response.toString());
    }
    return DogBreedImageListResponseEntity.fromJson(response);
  }

  // fetch random breed and sub breed image
  static Future<DogBreadSubBreedRandomImageResponseEntity>
      fetchBreedSubBreadRandomImage({
    required String dogBreed,
    required String dogSubBreed,
  }) async {
    var response =
        await HttpUtil().get('breed/$dogBreed/$dogSubBreed/images/random');
    if (kDebugMode) {
      print(response.toString());
    }
    return DogBreadSubBreedRandomImageResponseEntity.fromJson(response);
  }

  // fetch random breed and sub breed image list
  static Future<DogBreedSubBreedImageListResponseEntity>
      fetchBreedSubBreadImageList({
    required String dogBreed,
    required String dogSubBreed,
  }) async {
    var response = await HttpUtil().get('breed/$dogBreed/$dogSubBreed/images');
    if (kDebugMode) {
      print(response.toString());
    }
    return DogBreedSubBreedImageListResponseEntity.fromJson(response);
  }
}
