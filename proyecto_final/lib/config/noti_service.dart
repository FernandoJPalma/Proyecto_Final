import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotiService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

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
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
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
    try {
      return notificationsPlugin.show(id, title, body, notificationDetails());
    } catch (e) {
      debugPrint('Error al mostrar la notificacion: $e');
    }
  }

  Future<void> programarNotificaciones(int id, int h) async {
    await notificationsPlugin.zonedSchedule(
      0, // ID de notificación
      'Recordatorio importante', // Título
      'No olvides tu cita médica', // Cuerpo
      tz.TZDateTime.now(tz.local).add(Duration(hours: h)), // Fecha/hora con zona horaria
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle
      );
      print('pruebaaa');
  }
}
