import 'package:infoodmacion_app/api_services.dart';
import 'package:infoodmacion_app/domain/datasources/notification_datasource.dart';
import 'package:infoodmacion_app/domain/entities/notification_data.dart';
import 'package:infoodmacion_app/infraestructure/mappers/notification_mapper.dart';
import 'package:infoodmacion_app/infraestructure/models/notification_model.dart';

class NotificationDatasourceImpl implements NotificationDatasource {
  @override
  Future<List<NotificationData>> getNotifications() async {
    final notificationsModel = notificaciones.map((notification) => NotificationModel.fromJson(notification)).toList();
    return notificationsModel.map((notificationModel) => NotificationMapper.notificationModelToEntity(notificationModel)).toList();
  }
}