class DogType {
  final String name;
  final int pageIndex;

  DogType({
    required this.name,
    required this.pageIndex,
  });
}

final List<DogType> dogTypes = [
  DogType(
    name: 'Dog Breed Random Image',
    pageIndex: 1,
  ),
  DogType(
    name: 'Dog Breed Random \nImage List',
    pageIndex: 2,
  ),
  DogType(
    name: 'Dog Breed Sub \nBreed Random Image',
    pageIndex: 3,
  ),
  DogType(
    name: 'Dog Breed Sub \nBreed Image List',
    pageIndex: 4,
  ),
];
