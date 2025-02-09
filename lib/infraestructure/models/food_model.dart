class FoodModel {
  final String name;
  final String imageURL;
  final double portion; 
  final double kcal;
  final double kJ; // Kilojulios
  final double fat; // Grasa total
  final double saturatedFat;
  final double carbohydrates;
  final double sugar; // Azúcar
  final double fiber; // Fibra
  final double proteins; // Proteínas
  final String productBy;
  final String type;
  final bool promoted;

  FoodModel({required this.name, required this.imageURL, required this.portion, required this.kcal, required this.kJ, required this.fat, required this.saturatedFat, required this.carbohydrates, required this.sugar, required this.fiber, required this.proteins, required this.productBy, required this.type, required this.promoted});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    try {
      return FoodModel(
        name: json['nombre'] ?? 'Unknown',
        imageURL: json['imagen'] ?? 'assets/logo.png',
        portion: json['porcion'] != null
            ? (json['porcion'] is double
                ? json['porcion']
                : double.parse(json['porcion'].toString()))
            : 0.0, // Valor predeterminado si es null
        kcal: json['Kcal'] != null
            ? (json['Kcal'] is double
                ? json['Kcal']
                : double.parse(json['Kcal'].toString()))
            : 0.0,
        kJ: json['KJ'] != null
            ? (json['KJ'] is double
                ? json['KJ']
                : double.parse(json['KJ'].toString()))
            : 0.0,
        fat: json['Grasa'] != null
            ? (json['Grasa'] is double
                ? json['Grasa']
                : double.parse(json['Grasa'].toString()))
            : 0.0,
        saturatedFat: json['Grasa_saturada'] != null
            ? (json['Grasa_saturada'] is double
                ? json['Grasa_saturada']
                : double.parse(json['Grasa_saturada'].toString()))
            : 0.0,
        carbohydrates: json['Hidratos_de_carbono'] != null
            ? (json['Hidratos_de_carbono'] is double
                ? json['Hidratos_de_carbono']
                : double.parse(json['Hidratos_de_carbono'].toString()))
            : 0.0,
        sugar: json['azucar'] != null
            ? (json['azucar'] is double
                ? json['azucar']
                : double.parse(json['azucar'].toString()))
            : 0.0,
        fiber: json['fibra'] != null
            ? (json['fibra'] is double
                ? json['fibra']
                : double.parse(json['fibra'].toString()))
            : 0.0,
        proteins: json['proteinas'] != null
            ? (json['proteinas'] is double
                ? json['proteinas']
                : double.parse(json['proteinas'].toString()))
            : 0.0,
        productBy: json['product_by']?.toString() ?? '',
        type: json['type']?.toString() ?? '',
        promoted: json['promoted'] is bool
            ? json['promoted']
            : json['promoted'].toString() == 'true',
      );
    } catch (e, _) {
      //print('Error parsing FoodModel from JSON: $e');
      //print('StackTrace: $stackTrace');
      //print('JSON causing error: $json');
      rethrow;
    }
  }
}