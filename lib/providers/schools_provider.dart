import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:look_teacher/controller/school_crud_controller.dart';
import 'package:look_teacher/models/school_model.dart';

// schoolMapの画面表示からタップされて選択されたschoolIdを保持するプロバイダー
final selectedSchoolIdProvider = StateProvider<String?>((ref) => null);

// schoolListをFirestoreから監視し取得するプロバイダー
final schoolListStream = StreamProvider<DocumentSnapshot>((ref) {
  return SchoolCRUDController()
      .targetCollectionReference
      .doc('schoolList')
      .snapshots();
});


// schoolIdとschoolNameがセットになったMapのプロバイダー
final schoolMapProvider = StateProvider<Map<String, String>?>((ref) {
  return ref.watch(schoolListStream).when(
        data: (doc) {
          if (doc.exists) {
            final field = doc.data() as Map<String, dynamic>?;
            if (field != null && field.isNotEmpty) {
              return field.cast<String, String>();
            }
          }
        },
        loading: () {},
        error: (error, stackTrace) {},
      );
});

// 選択されているschoolIdのFirestoreのデータを監視するプロバイダー
final selectedSchoolStream = StreamProvider<DocumentSnapshot?>((ref) {
  
  // selectedSchoolIdが変更されると、再構築
  final selectedSchoolId = ref.watch(selectedSchoolIdProvider).state;

  // schoolMapが変更されると、再構築
  final schoolMap = ref.watch(schoolMapProvider).state;
  if (schoolMap != null && selectedSchoolId != null) {
    if (schoolMap.containsKey(selectedSchoolId)) {
      return SchoolCRUDController()
          .targetCollectionReference
          .doc(selectedSchoolId)
          .snapshots();
    }
  }
  return Stream.value(null);
});

// 選択されているschoolのプロバイダー 
final selectedSchoolProvider = StateProvider<SchoolModel?>((ref) {
  return ref.watch(selectedSchoolStream).when(
        data: (value) {
          if (value != null) {
            return SchoolModel.fromDoc(value);
          }
        },
        loading: () {},
        error: (error, stackTrace) {},
      );
});