import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:look_teacher/api/teacher/edit_teacher_profile.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

class EditTeacherProfile extends HookWidget {
  const EditTeacherProfile({Key? key, required this.teacher}) : super(key: key);
  final TeacherUserModel teacher;

  @override
  Widget build(BuildContext context) {
    final inputState = useState<String>('');
    final isBluetoothState = useState<bool>(teacher.isEnableBluetooth);

    return Scaffold(
      appBar: AppBar(
        title: const Text('編集'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          TextField(
            onChanged: (value) {
              inputState.value = value;
            },
            decoration: const InputDecoration(hintText: 'Enter a new name'),
          ),
          Row(
            children: [
              const Text('Bluetoothスキャンの有効化'),
              Switch(
                onChanged: (bool value) {
                  isBluetoothState.value = value;
                },
                value: isBluetoothState.value,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                editTeacherProfile(
                    newTeacherProfile: teacher.copyWith(
                        name: inputState.value,
                        isEnableBluetooth: isBluetoothState.value));
              Navigator.of(context).pop();
              },
              child: const Text('決定'))
        ])),
      ),
    );
  }
}
