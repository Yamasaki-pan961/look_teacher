import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/common/push_page.dart';
import 'package:look_teacher/providers/favorite_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';
import 'package:look_teacher/screen/school/school_class_list_screen.dart';

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

    schoolMap.forEach((schoolId, schoolName) {
      list.add(MaterialButton(
        onPressed: () {
          context.read(selectedSchoolIdProvider).state = schoolId;
          pushPage(context, const SchoolClassListScreen());
        },
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            HookBuilder(builder: (context) {
              final favoriteSchoolIdList =
                  useProvider(favoriteSchoolIdListProvider);
              final isFavorite = favoriteSchoolIdList.contains(schoolId);
              return IconButton(
                  onPressed: () async {
                    if (isFavorite) {
                      await context
                          .read(favoriteSchoolIdListProvider.notifier)
                          .remove([schoolId]);
                    } else {
                      await context
                          .read(favoriteSchoolIdListProvider.notifier)
                          .add([schoolId]);
                    }
                  },
                  icon: isFavorite
                      ? const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      : const Icon(Icons.star_border));
            }),
            Text(schoolName),
          ],
        ),
      ));
    });

    return list;
  }
}
