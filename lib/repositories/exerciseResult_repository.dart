import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:EnglishLearnerForum/model/exerciseResult.dart';
import 'package:EnglishLearnerForum/model/userInfo.dart';

class ExerciseResultRepository {
  CollectionReference exerciseResults;
  ExerciseResultRepository(UserInfo user) {
    exerciseResults = FirebaseFirestore.instance
        .collection('users')
        .doc(user.id)
        .collection('exerciseResults');
  }

  Stream<List<ExerciseResult>> getAllExerciseResults() {
    return exerciseResults.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => ExerciseResult.fromSnapshot(doc));
    });
  }

  Future<void> addNewExerciseResult(ExerciseResult exerciseResult) {
    return exerciseResults.add(exerciseResult.toDocument());
  }

  Future<void> updateExerciseResult(ExerciseResult exerciseResult) {
    return exerciseResults
        .doc(exerciseResult.id)
        .update(exerciseResult.toDocument());
  }

  Future<void> deleteExerciseResult(ExerciseResult exerciseResult) {
    return exerciseResults.doc(exerciseResult.id).delete();
  }
}
