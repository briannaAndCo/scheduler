// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:scheduler/scheduler.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Notification test'),
          ),
          body: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: RaisedButton(
                          child: const Text('Send Notification'),
                          onPressed: () {
                            TimeOfDay now = TimeOfDay.now();
                            Scheduler.scheduleNotification(
                                TimeOfDay(
                                    hour: now.hour, minute: now.minute + 1),
                                "Pill Reminder",
                                "Take your pill.",
                                "assets/pill.png",
                                "channel_id",
                                "desc",
                                4);
                          }),
                    ),
                    Center(
                      child: RaisedButton(
                        child: const Text('Cancel Notification'),
                        onPressed: () {
                          Scheduler.cancelNotification();
                        },
                      ),
                    ),
                    Center(
                      child: RaisedButton(
                        child: const Text('Cancel Current Notification'),
                        onPressed: () {
                          Scheduler.rescheduleCurrentNotification(
                              TimeOfDay.now());
                        },
                      ),
                    ),
                  ]))),
    );
  }
}
