import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_fitness_app/models/users_model.dart';
import 'package:flutter_fitness_app/services/firestore_services.dart';

class AuthServices {
  final FireStoreService _fireStoreService = FireStoreService();
  Future<UsersModel> createUser(UsersModel userModel) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: userModel.email,
            password: userModel.password!,
          );
      final userData = userCredential.user;
      if (userData != null) {
        final firestoreUser = UsersModel(
          email: userData.email!,
          password: userModel.password,
          uid: userModel.uid,
        );
        await _fireStoreService.addUser(firestoreUser);
        return firestoreUser;
      } else {
        throw Exception('Kullanıcı oluşturulurken hata oldu!');
      }
    } catch (e) {
      throw Exception('Bir problem oluştu: ${e.toString()}');
    }
  }

  Future<bool> loginUser(UsersModel userModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password!,
      );
      return true;
    } catch (e) {
      throw Exception('Giriş Yapılamadı');
    }
  }
}
