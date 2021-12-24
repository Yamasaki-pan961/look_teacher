import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/api/admin-school/delete_device.dart';
import 'package:look_teacher/api/admin-school/edit_device.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/models/device_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class DeviceListScreen extends HookWidget {
  const DeviceListScreen({Key? key})
      : super(key: key);
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
    final teacherSchool = useProvider(teacherSchoolProvider).state;
    if (teacherSchool != null) {
      for (final device in teacherSchool.deviceList) {
        list.add(Card(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(device.locationName),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('デバイス名: ${device.deviceName}'),
                  Text('デバイスID: ${device.deviceId}'),
                ],
              ),
            ),
            onTap: () {
              showSimpleDialog(
                  context: context,
                  title: const Text('デバイスの編集'),
                  content: DeviceEditForm(device: device));
            },
          ),
        )));
      }
    }

    return list;
  }
}

class DeviceEditForm extends HookWidget {
  DeviceEditForm({Key? key, required this.device}) : super(key: key);
  final DeviceModel device;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final nameState = useState<String>(device.deviceName);
    final locationNameState = useState<String>(device.locationName);
    return Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                const Text('デバイス名'),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                      initialValue: nameState.value,
                      onChanged: (value) {
                        nameState.value = value;
                      }),
                ))
              ],
            ),
            Row(
              children: [
                const Text('場所'),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        initialValue: locationNameState.value,
                        onChanged: (value) {
                          locationNameState.value = value;
                        },
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [const Text('デバイス ID : '), Text(device.deviceId)],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showQuestionDialog(
                        context: context,
                        noPressed: () {},
                        title: const Text('削除しますか？'),
                        yesPressed: () {
                          final school =
                              context.read(teacherSchoolProvider).state;
                          final schoolMap =
                              context.read(schoolMapProvider).state;
                          if (school != null && schoolMap != null) {
                            deleteDevice(
                                targetDevice: device,
                                school: school,
                                schoolMap: schoolMap);
                            Navigator.of(context).pop();
                          }
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  child: const Text('削除'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('キャンセル'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final school = context.read(teacherSchoolProvider).state;
                    final schoolMap = context.read(schoolMapProvider).state;
                    if (school != null && schoolMap != null) {
                      editDevice(
                          newDevice: device.copyWith(
                              deviceName: nameState.value,
                              locationName: locationNameState.value),
                          school: school,
                          schoolMap: schoolMap);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('編集'),
                )
              ],
            )
          ],
        ));
  }
}
