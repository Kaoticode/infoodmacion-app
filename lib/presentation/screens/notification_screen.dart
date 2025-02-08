import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/blocs/notification/notification_bloc.dart';
import 'package:infoodmacion_app/presentation/widgets/widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with AutomaticKeepAliveClientMixin {
  
  @override
  void initState() {
    super.initState();
    try {
      context.read<NotificationBloc>().add(GetNotifications());
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if(state is NotificationInitial || state is NotificationLoading || state is NotificationLoadedError) {
          return CircularProgressIndicatorCustom(
            width: screenWidth * 0.2, 
            height: screenHeight * 0.2, 
            color: AppStyle.primaryColor
          );
        }

        final notifications = state is NotificationLoaded ? state.notifications : const NotificationLoaded(notifications: []).notifications;
        return ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) => ContainerCustom(
            callback: (){}, 
            url: "assets/logo.png", 
            isLocalImage: true,
            title: notifications[index].title, 
            subtitle: notifications[index].description, 
            height: screenHeight * 0.15,
            margin: 10,
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}