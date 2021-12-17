import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/providers/favorite_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';

class FavoriteSchoolListScreen extends HookWidget {
  FavoriteSchoolListScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final favoriteSchoolMap = useProvider(favoriteSchoolMapProvider).state; 
    return SingleChildScrollView(
      child: Column(
        children: favoriteSchoolButtonList(favoriteSchoolMap , context),
      ),
    );
  }

  List<Widget> favoriteSchoolButtonList(
      Map<String, String> favoriteSchoolMap, BuildContext context){
    final list = <Widget>[];

    favoriteSchoolMap.forEach((key, value) {
      list.add(MaterialButton(
        onPressed: (){
          context.read(selectedSchoolIdProvider).state = key;
        },
        child: Text(value),
      ));
    });

    return list;
  }
}