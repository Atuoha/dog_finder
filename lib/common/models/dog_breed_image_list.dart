import 'package:equatable/equatable.dart';

import 'dog_image.dart';

class DogBreedImageListResponseEntity {
  String status;
  List<DogImageItem> message;

  DogBreedImageListResponseEntity({
    required this.status,
    required this.message,
  });

  factory DogBreedImageListResponseEntity.fromJson(Map<String, dynamic> json) {
    final status = json['status'];
    final message = json['message'];

    if (message is List) {
      final imageList = (message).map((image) {
        return DogImageItem.fromJson(image);
      }).toList();

      return DogBreedImageListResponseEntity(
        status: status,
        message: imageList,
      );
    } else {
      // Handle the case where "message" is not a list.
      return DogBreedImageListResponseEntity(
        status: status,
        message: [],
      );
    }
  }
}
