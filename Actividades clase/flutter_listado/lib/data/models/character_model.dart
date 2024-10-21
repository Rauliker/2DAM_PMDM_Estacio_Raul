class CharacterModel {
  final String name;
  final String house;
  final String image;
  final String age;
  final String species;

  CharacterModel(
      {required this.name,
      required this.house,
      required this.image,
      required this.age,
      required this.species});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
        name: json['name'],
        house: json['house'] ?? 'Unknown',
        image: json['image'],
        age: json['dateOfBirth'] ?? 'Unknown',
        species: json['species'] ?? 'Unknown');
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'house': house,
      'image': image,
      'Date of birth': age,
      'species': species
    };
  }
}
