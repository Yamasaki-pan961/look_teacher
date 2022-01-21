import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/common/push_page.dart';
import 'package:look_teacher/providers/favorite_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';
import 'package:look_teacher/screen/school/school_class_list_screen.dart';

class FavoriteSchoolListScreen extends HookWidget {
  FavoriteSchoolListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteSchoolMap = useProvider(favoriteSchoolMapProvider).state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: favoriteSchoolButtonList(favoriteSchoolMap, context),
        ),
      ),
    );
  }

  List<Widget> favoriteSchoolButtonList(
      Map<String, String> favoriteSchoolMap, BuildContext context) {
    final list = <Widget>[];

    favoriteSchoolMap.forEach((schoolId, schoolName) {
      list.add(Card(
        child: MaterialButton(
          onPressed: () {
            context.read(selectedSchoolIdProvider).state = schoolId;
            pushPage(context, const SchoolClassListScreen());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ));
    });

    return list;
  }
}
