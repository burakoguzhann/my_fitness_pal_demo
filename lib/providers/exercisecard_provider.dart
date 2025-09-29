import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/models/exercise_model.dart';

class ExercisecardProvider extends ChangeNotifier {
  final List<ExerciseModel> _exercise = [];
  List<ExerciseModel> get exercise => _exercise;

  void addExercise(ExerciseModel exerciseModel) {
    _exercise.add(exerciseModel);
    notifyListeners();
  }
}
