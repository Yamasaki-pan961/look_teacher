import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class SchoolListScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final schoolMap = useProvider(schoolMapProvider).state;
    return Column(
      children: schoolButtonList(schoolMap ?? {}, context),
    );
  }

  List<Widget> schoolButtonList(
      Map<String, String> schoolMap, BuildContext context) {
    final list = <Widget>[];

    schoolMap.forEach((key, value) {
      list.add(MaterialButton(
          onPressed: () {
            context.read(selectedSchoolIdProvider).state = key;
            log('onPressed key: $key value: $value');
            // Navigator.of(context).pushNamed('');
          },
          child: Text(value)));
    });

    return list;
  }
}
