import 'package:infoodmacion_app/domain/entities/notification_data.dart';
import 'package:infoodmacion_app/infraestructure/models/notification_model.dart';

class NotificationMapper {
  static NotificationData notificationModelToEntity(NotificationModel model) => NotificationData(
    title: model.title, 
    description: model.description, 
    dateTime: model.dateTime
  );
}