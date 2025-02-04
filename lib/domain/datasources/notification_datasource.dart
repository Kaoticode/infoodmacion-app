import 'package:infoodmacion_app/domain/entities/notification_data.dart';

abstract class NotificationDatasource {
  Future<List<NotificationData>> getNotifications();
}