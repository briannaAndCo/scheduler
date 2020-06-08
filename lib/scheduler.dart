import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Scheduler {
  static const MethodChannel _channel =
      const MethodChannel('scheduler');

  static Future<void> scheduleNotification(
      TimeOfDay alarmTime,
      String title,
      String text,
      String iconResource,
      String channelId,
      String channelName,
      int channelImportance,
      ) async =>
      await _channel
          .invokeMethod('SchedulerPlugin.scheduleNotification', <dynamic>[
        alarmTime.hour,
        alarmTime.minute,
        title,
        text,
        iconResource,
        channelId,
        channelName,
        channelImportance
      ]);

  static Future<void> cancelNotification() async =>
      await _channel.invokeMethod('SchedulerPlugin.cancelNotification', <dynamic>[]);

  static Future<void> rescheduleCurrentNotification(TimeOfDay alarmTime) async =>
      await _channel.invokeMethod('SchedulerPlugin.rescheduleCurrentNotification',
          <dynamic>[alarmTime.hour, alarmTime.minute]);
}
