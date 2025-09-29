import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fitness_app/models/users_model.dart';

class FireStoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<UsersModel> addUser(UsersModel userModel) async {
    await users.add(userModel.toJson());
    return userModel;
  }
}
