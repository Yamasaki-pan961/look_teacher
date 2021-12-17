import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/favorite_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';
import 'package:look_teacher/screen/bluetooth_screen.dart';
import 'package:look_teacher/screen/email_verified_screen.dart';
import 'package:look_teacher/screen/favorite_school_list_screen.dart';
import 'package:look_teacher/screen/school_list_screen.dart';
import 'package:look_teacher/screen/user_profile_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const _tab = <Tab>[
    Tab(text: 'Car', icon: Icon(Icons.directions_car)),
    Tab(text: 'Bicycle', icon: Icon(Icons.directions_bike)),
    Tab(text: 'Boat', icon: Icon(Icons.directions_boat)),
  ];
  @override
  Widget build(BuildContext context) {
    // FireAuthのユーザーを取得
    final user = useProvider(authUserStreamProvider).data?.value;
    if (user != null) {
      if (!user.emailVerified) {
        // ログインしていて、メールの確認がされてないとき
        return const EmailVerifiedScreen();
      }
    }
    // 必要なデータをプロバイダーから取得する。HookWidgetのみプロバイダーを利用可能
    final schoolMap = useProvider(schoolMapProvider).state;
    final selectedSchool = useProvider(selectedSchoolProvider).state;
    final currentTeacher = useProvider(currentTeacherProvider).state;
    final teacherSchool = useProvider(teacherSchoolProvider).state;
    final favoriteSchoolIdList = useProvider(favoriteSchoolIdListProvider);
    final favoriteTeacherIdList = useProvider(favoriteTeacherIdListProvider);
    return DefaultTabController(
        length: _tab.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ホーム'),
            bottom: const TabBar(
              tabs: _tab,
            ),
          ),
          body: TabBarView(children: <Widget>[
            SchoolListScreen(),
            FavoriteSchoolListScreen(),
            TabPage(title: 'Boat', icon: Icons.directions_boat),
          ]),
          // drawer 左からスワイプするとメニュー画面が出てくる
          drawer: Drawer(
            child: Center(
              child: ListView(
                children: [
                  if (currentTeacher == null)
                    // ログインしていないとき、教員登録・ログインボタンが表示される
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
                    // ログインしているとき、ログアウトボタンが表示される。
                    Column(children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push<Widget>(MaterialPageRoute(
                              builder: (context) => UserProfileScreen()));
                        },
                        child: Text('ユーザープロファイル設定'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (currentTeacher.schoolId == '') {
                            showSimpleDialog(
                                context: context,
                                title: const Text('無効です'),
                                content: const Text('学校に未参加の場合デバイスを登録できません'));
                          } else {
                            Navigator.of(context).push<Widget>(
                                MaterialPageRoute(
                                    builder: (context) => BluetoothScreen()));
                          }
                        },
                        child: const Text('Bluetoothデバイスの登録'),
                      ),
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
