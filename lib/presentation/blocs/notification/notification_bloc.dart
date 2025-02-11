import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infoodmacion_app/domain/entities/notification_data.dart';
import 'package:infoodmacion_app/presentation/repositories_provider.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<GetNotifications>(_onGetNotifications);
  }

  Future<void> _onGetNotifications(GetNotifications event, Emitter<NotificationState> emit) async {
    emit(NotificationLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(NotificationLoaded(notifications: await notificationRepositoryProvider.getNotifications()));
  }
}
