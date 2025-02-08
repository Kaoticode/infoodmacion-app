part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();
  
  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}
final class NotificationLoading extends NotificationState {}

final class NotificationLoaded extends NotificationState {
  final List<NotificationData> notifications;

  const NotificationLoaded({required this.notifications});

  @override
  List<Object> get props => [notifications];
}

final class NotificationLoadedError extends NotificationState {
  final int codeHttp;
  final String message;

  const NotificationLoadedError({required this.codeHttp, required this.message});

  @override
  List<Object> get props => [codeHttp, message];
}