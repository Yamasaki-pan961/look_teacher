import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/device_model.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';
import 'package:look_teacher/screen/email_verified_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const _tab = <Tab>[
    Tab(text: 'Car', icon: Icon(Icons.directions_car)),
    Tab(text: 'Bicycle', icon: Icon(Icons.directions_bike)),
    Tab(text: 'Boat', icon: Icon(Icons.directions_boat)),
  ];
  @override
  Widget build(BuildContext context) {
    final user = useProvider(authUserStreamProvider).data?.value;
    if (user != null) {
      if (!user.emailVerified) {
        return const EmailVerifiedScreen();
      }
    }

    final schoolMap = useProvider(schoolMapProvider).state;
    final selectedSchool = useProvider(selectedSchoolProvider).state;
    final currentTeacher = useProvider(currentTeacherProvider).state;
    final teacherSchool = useProvider(teacherSchoolProvider).state;
    return DefaultTabController(
        length: _tab.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ホーム'),
            bottom: const TabBar(
              tabs: _tab,
            ),
          ),
          body: const TabBarView(children: <Widget>[
            TabPage(title: 'Car', icon: Icons.directions_car),
            TabPage(title: 'Bicycle', icon: Icons.directions_bike),
            TabPage(title: 'Boat', icon: Icons.directions_boat),
          ]),
          drawer: Drawer(
            child: Center(
              child: ListView(
                children: [
                  if (currentTeacher == null)
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/make_user');
                          },
                          child: const Text('教員登録'),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: const Text('教員ログイン'),
                        )
                      ],
                    ),
                  if (currentTeacher != null)
                    Column(children: [
                      MaterialButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                        child: const Text('ログアウト'),
                      )
                    ])
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}

class TabPage extends StatelessWidget {
  const TabPage({Key? key, required this.icon, required this.title})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 64),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
