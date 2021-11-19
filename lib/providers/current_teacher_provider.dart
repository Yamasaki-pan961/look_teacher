import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/models/teacher_user_model.dart';

final authUserStreamProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.userChanges();
});

final currentTeacherProvider =
    StateProvider<Future<TeacherUserModel?>>((ref) async {
  ref.watch(authUserStreamProvider);
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    if (!userDoc.exists) {
      final teacher =
          TeacherUserModel(uid: user.uid, name: user.displayName ?? '');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(teacher.toMap());
      return teacher;
    }
    return TeacherUserModel.fromDoc(userDoc);
  }
  return null;
});

final authErrorProvider = StateProvider.autoDispose((ref) => '');