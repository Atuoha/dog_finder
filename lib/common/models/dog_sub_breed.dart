import 'package:equatable/equatable.dart';

class DogSubBreed extends Equatable {
  final String? name;

  const DogSubBreed({
    this.name = "",
  });

  factory DogSubBreed.initial() => const DogSubBreed(
        name: "",
      );

  @override
  List<Object?> get props => [name];

  factory DogSubBreed.fromJson(String json) {
    final subBreeds = json;

    return DogSubBreed(
      name: subBreeds,
    );
  }

  DogSubBreed copyWith({
    String? name,
  }) {
    return DogSubBreed(
      name: name ?? this.name,
    );
  }
}

class DogSubBreedListResponseEntity {
  String status;
  List<DogSubBreed> message;

  DogSubBreedListResponseEntity({
    required this.status,
    required this.message,
  });

  factory DogSubBreedListResponseEntity.fromJson(Map<String, dynamic> json) {
    final status = json['status'];
    final message = json['message'];

    if (message is List) {
      final subBreedsList = (message).map((subBreed) {
        return DogSubBreed.fromJson(subBreed);
      }).toList();

      return DogSubBreedListResponseEntity(
        status: status,
        message: subBreedsList,
      );
    } else {
      // Handle the case where "message" is not a list.
      return DogSubBreedListResponseEntity(
        status: status,
        message: [],
      );
    }
  }
}
