import 'package:equatable/equatable.dart';

import 'dog_image.dart';

class DogBreedSubBreedImageListResponseEntity {
  String status;
  List<DogImageItem> message;

  DogBreedSubBreedImageListResponseEntity({
    required this.status,
    required this.message,
  });

  factory DogBreedSubBreedImageListResponseEntity.fromJson(Map<String, dynamic> json) {
    final status = json['status'];
    final message = json['message'];

    if (message is List) {
      final imageList = (message).map((image) {
        return DogImageItem.fromJson(image);
      }).toList();

      return DogBreedSubBreedImageListResponseEntity(
        status: status,
        message: imageList,
      );
    } else {
      // Handle the case where "message" is not a list.
      return DogBreedSubBreedImageListResponseEntity(
        status: status,
        message: [],
      );
    }
  }
}
