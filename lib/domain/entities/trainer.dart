import 'package:equatable/equatable.dart';

class Trainer extends Equatable {
  final String name;
  final String image;
  final bool isLocalImage;
  final String ig;
  final bool isPromoted;

  const Trainer({required this.name, required this.image, required this.isLocalImage, required this.ig, required this.isPromoted});
  
  @override
  List<Object?> get props => [name, image, isLocalImage, ig, isPromoted];
}