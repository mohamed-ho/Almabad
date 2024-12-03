import 'dart:convert';

import 'package:almabad/core/constant/firebase_constant.dart';
import 'package:almabad/core/constant/shared_preferences_constant.dart';
import 'package:almabad/features/auth/domain/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends User {
  UserModel(
      {super.id,
      super.name,
      super.password,
      required super.email,
      super.verified});

  toJson() {
    return {
      FirebaseConstant.userName: name,
      FirebaseConstant.userEmail: email,
    };
  }

  toLocal() {
    return {
      SharedPreferencesConstant.userName: name,
      SharedPreferencesConstant.userEmail: email,
      SharedPreferencesConstant.userId: id,
    };
  }

  factory UserModel.fromLocal(String user) {
    final json = jsonDecode(user);
    return UserModel(
      id: json[SharedPreferencesConstant.userId],
      name: json[SharedPreferencesConstant.userName],
      email: json[SharedPreferencesConstant.userEmail],
    );
  }

  factory UserModel.fromUser(User user) {
    return UserModel(
        id: user.id,
        name: user.name,
        password: user.password,
        email: user.email);
  }

  factory UserModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot query) {
    return UserModel(
        id: query.id,
        email: query[FirebaseConstant.userEmail],
        name: query[FirebaseConstant.userName]);
  }
}
