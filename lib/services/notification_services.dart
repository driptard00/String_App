import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  // INITIALIZATION
  Future<void> initNotification() async {
    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings("images/launcherIcon.png");

    var iosInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async{
        
      },
    );

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async{
        
      },
    );
  }

  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails("channelId", "channelName",
        importance: Importance.max
      ),
      iOS: DarwinNotificationDetails()
    );
  }

  // SHOW NOTIFICATION
  Future showNotification({int id= 0, String? title ,String? body, String? payload}) async {
    return notificationsPlugin.show(id, title, body, await notificationDetails());
  }
}