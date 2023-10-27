import 'package:equatable/equatable.dart';

class DogBreed extends Equatable {
  final String? name;

  const DogBreed({
    this.name,
  });

  factory DogBreed.initial() => const DogBreed(
        name: "",
      );

  @override
  List<Object?> get props => [name];

  factory DogBreed.fromJson(MapEntry<String, dynamic> entry) {
    final name = entry.key;

    return DogBreed(
      name: name,
    );
  }

  DogBreed copyWith({
    String? name,
    List<dynamic>? subBreeds,
  }) {
    return DogBreed(
      name: name ?? this.name,
    );
  }
}

class DogBreedListResponseEntity {
  String status;
  List<DogBreed> message;

  DogBreedListResponseEntity({
    required this.status,
    required this.message,
  });

  factory DogBreedListResponseEntity.fromJson(Map<String, dynamic> json) {
    final status = json['status'];
    final message = json['message'];

    if (message is Map<String, dynamic>) {
      final dogBreeds = <DogBreed>[];

      message.forEach((key, value) {
        dogBreeds.add(DogBreed(name: key));
      });

      return DogBreedListResponseEntity(
        status: status,
        message: dogBreeds,
      );
    } else {
      // Handle the case where "message" is not a map.
      return DogBreedListResponseEntity(
        status: status,
        message: [],
      );
    }
  }
}
