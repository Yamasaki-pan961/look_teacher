import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:look_teacher/logic/bluetooth_scan.dart';

class BluetoothScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                  child: Text('${key.name}, 電波強度:${value + 100}'),
                ));
              });
              return Center(child: SingleChildScrollView(child: Column(children: buttonList,)));
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
