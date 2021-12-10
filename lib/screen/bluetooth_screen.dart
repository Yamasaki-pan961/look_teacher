import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/logic/bluetooth_scan.dart';
import 'package:look_teacher/models/device_model.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class BluetoothScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final teacherSchool = useProvider(teacherSchoolProvider).state;
    final teacher = useProvider(currentTeacherProvider).state;
    final List<DeviceModel> deviceList = () {
      if (teacherSchool != null) {
        return teacherSchool.deviceList;
      } else {
        return <DeviceModel>[];
      }
    }();
    return Scaffold(
      appBar: AppBar(
        title: const Text('デバイスの登録'),
      ),
      body: FutureBuilder(
          future: bluetoothScan(),
          builder: (context,
              AsyncSnapshot<Map<BluetoothDevice, int>> asyncDeviceMap) {
            if (asyncDeviceMap.hasData) {
              final deviceMap = <BluetoothDevice, int>{...asyncDeviceMap.data!};
              final buttonList = <Widget>[];
              deviceMap.forEach((device, rssi) {
                bool yetAdding = true;
                for (final deviceModel in deviceList) {
                  if (deviceModel.deviceId == device.id.toString()) {
                    buttonList.add(MaterialButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Text('登録済み ${device.name}, 電波強度:${rssi + 100}'),
                          Text(
                              '登録名:${deviceModel.deviceName}, 場所:${deviceModel.locationName}')
                        ],
                      ),
                    ));
                    yetAdding = false;
                    break;
                  }
                }
                if (yetAdding) {
                  buttonList.add(MaterialButton(
                    onPressed: () {
                      showSimpleDialog(
                          context: context,
                          title: Text('${teacherSchool?.schoolName}に登録'),
                          content: DeviceRegisterForm(
                            device: device,
                            teacher: teacher!,
                          ));
                    },
                    child: Text('${device.name}, 電波強度:${rssi + 100}'),
                  ));
                }
              });
              buttonList.add(MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push<Widget>(MaterialPageRoute(
                      builder: (context) => BluetoothScreen()));
                },
                child: const Text('再スキャン'),
              ));
              return Center(
                  child: SingleChildScrollView(
                      child: Column(
                children: buttonList,
              )));
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [CircularProgressIndicator(), Text('スキャン中')],
              ),
            );
          }),
    );
  }
}

class DeviceRegisterForm extends HookWidget {
  DeviceRegisterForm({Key? key, required this.device, required this.teacher})
      : super(key: key);
  final BluetoothDevice device;
  final TeacherUserModel teacher;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final nameState = useState<String>(device.name);
    final locationNameState = useState<String>('${teacher.name}の部屋');
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
                  ),
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
                children: [
                  const Text('デバイス ID : '),
                  Text(device.id.toString())
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('キャンセル'),
                ),
                MaterialButton(
                  onPressed: () {
                    final school = context.read(teacherSchoolProvider).state;
                    final schoolMap = context.read(schoolMapProvider).state;
                    if (school != null) {
                      final addDevice = DeviceModel(
                          deviceId: device.id.toString(),
                          deviceName: nameState.value,
                          locationName: locationNameState.value);
                      SchoolCRUDController().updateRecord(
                          school.schoolId,
                          school.copyWith(
                              deviceList: [...school.deviceList, addDevice]),
                          schoolMap);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('登録'),
                )
              ],
            )
          ],
        ));
  }
}
