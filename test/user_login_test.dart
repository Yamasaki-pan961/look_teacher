import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/providers/current_user_provider.dart';

Future<void> main() async {
  test('login test', () async {
    final teacher = await ProviderContainer().read(currentUserProvider).state;
    log(teacher.toString());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: 'aa@a.com', password: 'aaaaaa');
    final teacher2 = await ProviderContainer().read(currentUserProvider).state;
    log(teacher2.toString());
  });
}
