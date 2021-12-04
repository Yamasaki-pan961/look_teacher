import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/logic/bluetooth_scan.dart';
import 'package:look_teacher/models/teacher_user_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';

class BluetoothScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final teacherSchool = useProvider(teacherSchoolProvider).state;
    final teacher = useProvider(currentTeacherProvider).state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('デバイスの登録'),
      ),
      body: FutureBuilder(
          future: bluetoothScan(),
          builder: (context, AsyncSnapshot<Map<BluetoothDevice, int>?> value) {
            if (value.hasData) {
              final buttonList = <Widget>[];
              value.data?.forEach((key, value) {
                buttonList.add(MaterialButton(
                  onPressed: () {
                    showSimpleDialog(
                        context: context,
                        title: Text('${teacherSchool?.schoolName}に登録'),
                        content: DeviceRegisterForm(
                          device: key,
                          teacher: teacher!,
                        ));
                  },
                  child: Text('${key.name}, 電波強度:${value + 100}'),
                ));
              });
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
            )
          ],
        ));
  }
}
