import 'package:infoodmacion_app/domain/datasources/notification_datasource.dart';
import 'package:infoodmacion_app/domain/entities/notification_data.dart';
import 'package:infoodmacion_app/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDatasource datasource;

  NotificationRepositoryImpl({required this.datasource});

  @override
  Future<List<NotificationData>> getNotifications() => datasource.getNotifications();
}