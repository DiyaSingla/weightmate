import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  Future scheduleNotification(TimeOfDay time) async {
    final scheduledTime = tz.TZDateTime.now(tz.local)
        .add(Duration(seconds: 1)); // Avoid scheduling in the past
    final tz.TZDateTime notificationTime = tz.TZDateTime.from(
      DateTime(
        scheduledTime.year,
        scheduledTime.month,
        scheduledTime.day,
        time.hour,
        time.minute,
      ),
      tz.local,
    );

    if (notificationTime.isBefore(scheduledTime)) {
      notificationTime.add(Duration(days: 1)); // Schedule for the next day
    }
    return notificationsPlugin.zonedSchedule(
        0,
        'Daily Reminder',
        'It’s time for your daily weight check!',
        tz.TZDateTime.from(
          notificationTime,
          tz.local,
        ),
        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
