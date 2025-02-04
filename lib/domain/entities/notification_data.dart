import 'package:equatable/equatable.dart';

class NotificationData extends Equatable {
  final String title;
  final String description;
  final DateTime dateTime;

  const NotificationData({required this.title, required this.description, required this.dateTime});
  
  @override
  List<Object?> get props => [title, description, dateTime];
}