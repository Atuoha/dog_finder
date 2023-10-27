import 'dog_image.dart';

class DogBreadSubBreedRandomImageResponseEntity {
  String status;
  DogImageItem message;

  DogBreadSubBreedRandomImageResponseEntity({
    required this.status,
    required this.message,
  });

  factory DogBreadSubBreedRandomImageResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      DogBreadSubBreedRandomImageResponseEntity(
        status: json["status"],
        message: json["message"] == ""
            ? DogImageItem.initial()
            : DogImageItem.fromJson(json["message"]),
      );
}
