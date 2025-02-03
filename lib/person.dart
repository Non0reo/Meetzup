class Person {
  String name;
  int age;
  String username;
  String description;
  int pointCount;
  Atributes atributes;
  List<String> images;
  String profilePicture;

  Person({
    required this.name,
    required this.age,
    required this.username,
    required this.description,
    required this.pointCount,
    required this.atributes,
    required this.images,
    required this.profilePicture,
  });
}


class Atributes {
  Map<String, dynamic> superficial;
  Map<String, dynamic> factual;

  Atributes({
    required this.superficial,
    required this.factual,
  });
}