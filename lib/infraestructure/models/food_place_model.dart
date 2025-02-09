class FoodPlaceModel {
  final int id;
  final String name;
  final String image;
  final String description;
  final bool isPromoted;

  FoodPlaceModel({required this.id, required this.name, required this.image, required this.description, required this.isPromoted});

  factory FoodPlaceModel.fromJson(Map<String, dynamic> json) => 
    FoodPlaceModel(
      id: json['id'], name: json['nombre'], image: json['imagen'] ?? 'assets/logo.png', description: json['descripcion'], isPromoted: json['promoted']
    );
}