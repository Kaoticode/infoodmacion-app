class TrainerModel {
  final String name;
  final String image;
  final bool isLocalImage;
  final String ig;
  final bool isPromoted;

  TrainerModel({required this.name, required this.image, required this.isLocalImage, required this.ig, required this.isPromoted});

  factory TrainerModel.fromJson(Map<String, dynamic> json) => TrainerModel(
    name: json['nombre'], 
    image: json['imagen'], 
    isLocalImage: json['imageLocal'],
    ig: json['ig'], 
    isPromoted: json['promoted']
  );
}