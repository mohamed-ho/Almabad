import 'package:almabad/core/constant/firebase_constant.dart';
import 'package:almabad/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserRemoteDataSource {
  Future<void> addUser(UserModel user);
  Future<void> deleteUser(String id);
  Future<UserModel> getUser(String email);
  Future<bool> isExist(String email);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  UserRemoteDataSourceImpl({required this.firebaseFirestore});
  @override
  Future<void> addUser(UserModel user) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConstant.userCollection)
          .add(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConstant.userCollection)
          .doc(id)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser(String email) async {
    final result = await firebaseFirestore
        .collection(FirebaseConstant.userCollection)
        .where(FirebaseConstant.userEmail, isEqualTo: email)
        .get();
    return UserModel.fromQueryDocumentSnapshot(result.docs[0]);
  }

  @override
  Future<bool> isExist(String email) async {
    final result = await firebaseFirestore
        .collection(FirebaseConstant.userCollection)
        .where(FirebaseConstant.userEmail, isEqualTo: email)
        .get();
    if (result.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
