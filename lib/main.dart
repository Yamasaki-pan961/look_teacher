import 'dart:async';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:look_teacher/logic/background_process.dart';
import 'package:look_teacher/logic/bluetooth_scan.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
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

  await BackgroundProcess().periodic(
      interval: const Duration(seconds: 20),
      function: (Timer t) async {
        final preference = await SharedPreferences.getInstance();
        final filterIdList = preference.getStringList('filterIdList');
        if (filterIdList != null) {
          final nearestDevice = await getNearestDeviceId(filterIdList);
          await AwesomeNotifications().createNotification(
              content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'Scanning Result',
            body: nearestDevice.toString(),
            fullScreenIntent: true,
          ));
        }else{
          log('filterIdList not found');
        }
      });
  runApp(const MyApp());
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    FirebaseFirestore.instance
        .collection('test')
        .add(<String, dynamic>{'test': 'test'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          log((await bluetoothScan()).toString());
          final preference = await SharedPreferences.getInstance();
          await preference.setStringList(
              'filterIdList', ['DC:0D:30:03:53:3A', 'DC:0D:30:03:52:73']);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
