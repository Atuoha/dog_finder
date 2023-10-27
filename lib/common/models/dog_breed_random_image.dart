import 'dog_image.dart';

class DogBreadRandomImageResponseEntity {
  String status;
  DogImageItem message;

  DogBreadRandomImageResponseEntity({
    required this.status,
    required this.message,
  });

  factory DogBreadRandomImageResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      DogBreadRandomImageResponseEntity(
        status: json["status"],
        message: json["message"] == ""
            ? DogImageItem.initial()
            : DogImageItem.fromJson(json["message"]),
      );
}
