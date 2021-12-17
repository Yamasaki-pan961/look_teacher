import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/screen/auth/email_verified_screen.dart';
import 'package:look_teacher/screen/home_screen.dart';
import 'package:look_teacher/screen/auth/login_screen.dart';
import 'package:look_teacher/screen/auth/make_user_screen.dart';

Future<void> main() async {
  // Firebaseの初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // 通知の初期化
  await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
        ),
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  if (!await AwesomeNotifications().isNotificationAllowed()) {
    await AwesomeNotifications()
        .requestPermissionToSendNotifications(channelKey: 'basic_channel');
  }

  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomeScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/make_user': (BuildContext context) => MakeUserScreen(),
        '/email_verified': (BuildContext context) => const EmailVerifiedScreen()
      },
    );
  }
}
