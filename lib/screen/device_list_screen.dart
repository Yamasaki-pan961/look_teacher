import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:look_teacher/models/device_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';

class DeviceListScreen extends HookWidget {
  const DeviceListScreen({Key? key, required this.deviceList})
      : super(key: key);
  final List<DeviceModel> deviceList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('デバイス一覧'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: deviceButtonList(context),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> deviceButtonList(BuildContext context) {
    final list = <Widget>[];
    final teacherSchool = useProvider(teacherSchoolProvider).state!;
    for (final device in teacherSchool.deviceList) {
      list.add(MaterialButton(
        child: Text(device.deviceName),
        onPressed: () {
          Text(device.deviceName);
          Text(device.deviceId);
          Text(device.locationName);
        },
      ));
    }

    return list;
  }
}
