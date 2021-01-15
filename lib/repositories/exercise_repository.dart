import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:EnglishLearnerForum/model/exercise.dart';

class ExerciseRepository {
  CollectionReference exercises;
  ExerciseRepository() {
    exercises = FirebaseFirestore.instance.collection('exercises');
  }

  Stream<List<Exercise>> getAllExercises() {
    return exercises.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Exercise.fromSnapshot(doc));
    });
  }

  Future<void> addNewExercise(Exercise exercise) {
    return exercises.add(exercise.toDocument());
  }

  Future<void> updateExercise(Exercise exercise) {
    return exercises.doc(exercise.id).update(exercise.toDocument());
  }

  Future<void> deleteExercise(Exercise exercise) {
    return exercises.doc(exercise.id).delete();
  }
}
