import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService {
final FlutterLocalNotificationsPlugin notificationsPlugin = 
      FlutterLocalNotificationsPlugin();

Future<void> initNotification() async {
  const AndroidInitializationSettings initSettingsAndroid = 
      AndroidInitializationSettings('@drawable/ic_notification');
  
  const DarwinInitializationSettings initSettingsIOS = 
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const initSettings = InitializationSettings(
    android: initSettingsAndroid,
    iOS: initSettingsIOS,
  );
  
  await notificationsPlugin.initialize(initSettings);

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'daily_channel_id', // id
      'Daily Notifications', // title
      description: 'Daily Notification Channel',
      importance: Importance.max,
    );

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

}

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android:  AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
        icon: 'ic_notification',
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification({
    required id,
    required String title,
    required String body,
  }) async {
    try{
      return notificationsPlugin.show(
        id, 
        title, 
        body, 
        const NotificationDetails());
    }catch(e){
      debugPrint('Error al mostrar la notificacion: $e');
    }

  }
}