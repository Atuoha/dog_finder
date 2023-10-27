class DogImageItem {
  String message;

  DogImageItem({
    required this.message,
  });


  factory DogImageItem.initial()=>DogImageItem(message: "");

  factory DogImageItem.fromJson(String data) =>
      DogImageItem(
        message: data,
      );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}