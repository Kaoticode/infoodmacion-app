class NotificationModel {
  final String title;
  final String description;
  final DateTime dateTime;

  NotificationModel({required this.title, required this.description, required this.dateTime});

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    title: json['titulo'], 
    description: json['descripcion'], 
    dateTime: DateTime.parse(json['fecha'])
  );
}