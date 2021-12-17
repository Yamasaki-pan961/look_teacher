import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/common/show_dialog.dart';
import 'package:look_teacher/models/school_model.dart';
import 'package:look_teacher/providers/current_teacher_provider.dart';
import 'package:look_teacher/providers/favorite_provider.dart';
import 'package:look_teacher/providers/schools_provider.dart';
import 'package:look_teacher/screen/admin/admin_screen.dart';
import 'package:look_teacher/screen/bluetooth_screen.dart';
import 'package:look_teacher/screen/auth/email_verified_screen.dart';
import 'package:look_teacher/screen/build_school_screen.dart';
import 'package:look_teacher/screen/school/favorite_school_list_screen.dart';
import 'package:look_teacher/screen/school/school_list_screen.dart';
import 'package:look_teacher/screen/teacher/user_profile_screen.dart';

final _tab = <Tab>[
  Tab(
    icon: const Icon(Icons.search),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [Icon(Icons.account_balance), Text('School')],
    ),
  ),
  Tab(
    icon: const Icon(Icons.star),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [Icon(Icons.account_balance), Text('School')],
    ),
  ),
  Tab(
    icon: const Icon(Icons.star),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [Icon(Icons.person), Text('Teacher')],
    ),
  ),
];

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

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

    final userProfileScreen = UserProfileScreen();
    final mySchoolScreen = Container();
    final bluetoothScreen = BluetoothScreen();
    final schoolAdminScreen = AdminScreen();
    final buildSchoolScreen = BuildSchoolScreen();

    return DefaultTabController(
        length: _tab.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ホーム'),
            bottom: TabBar(
              tabs: _tab,
            ),
          ),
          body: TabBarView(children: <Widget>[
            SchoolListScreen(),
            Container(),
            Container(),
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
                              builder: (context) => userProfileScreen));
                        },
                        child: const Text('ユーザープロファイル設定'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (teacherSchool != null) {
                            Navigator.of(context).push<Widget>(
                                MaterialPageRoute(
                                    builder: (context) => mySchoolScreen));
                          } else {
                            showAlertDialog(
                                context: context,
                                title: const Text('不正な操作'),
                                content: const Text('学校に参加していません'));
                          }
                        },
                        child: const Text('自分の学校'),
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
                                    builder: (context) => bluetoothScreen));
                          }
                        },
                        child: const Text('Bluetoothデバイスの登録'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (teacherSchool != null) {
                            if (teacherSchool.adminsId
                                .contains(currentTeacher.uid)) {
                              Navigator.of(context).push<Widget>(
                                  MaterialPageRoute(
                                      builder: (context) => schoolAdminScreen));
                            } else {
                              showAlertDialog(
                                  context: context,
                                  title: const Text('不正な操作'),
                                  content: const Text('あなたは所属する学校の管理者ではありません'));
                            }
                          } else {
                            showAlertDialog(
                                context: context,
                                title: const Text('不正な操作'),
                                content: const Text('学校に参加していません'));
                          }
                        },
                        child: const Text('学校の管理'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (currentTeacher.schoolId == '') {
                            Navigator.of(context).push<Widget>(
                                MaterialPageRoute(
                                    builder: (context) => buildSchoolScreen));
                          } else {
                            showAlertDialog(
                                context: context,
                                title: const Text('不正な操作'),
                                content: const Text('学校に参加済みの教員は学校を作成できません'));
                          }
                        },
                        child: const Text('学校を作る'),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          showSimpleDialog(
                              context: context,
                              title: const Text('ログアウトしますか'),
                              content: Row(
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('キャンセル'),
                                  ),
                                  MaterialButton(
                                    onPressed: () async {
                                      await FirebaseAuth.instance.signOut();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('ログアウト'),
                                  )
                                ],
                              ));
                        },
                        child: const Text('ログアウト'),
                      )
                    ])
                ],
              ),
            ),
          ),
        ));
  }
}
