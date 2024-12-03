import 'package:almabad/core/constant/firebase_constant.dart';
import 'package:almabad/features/home/data/models/temple_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TempleRemoteDataSource {
  Future<List<TempleModel>> getTemples();
  Future<TempleModel> getTemple(String id);
  Future<void> addTemple(TempleModel temple);
}

class TempleRemoteDataSourceImpl implements TempleRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  TempleRemoteDataSourceImpl({required this.firebaseFirestore});
  @override
  Future<TempleModel> getTemple(String id) async {
    try {
      final result = await firebaseFirestore
          .collection(FirebaseConstant.templeCollection)
          .where(FirebaseConstant.templeId, isEqualTo: id)
          .get();
      return TempleModel.fromQueryDocumentSnapshot(result.docs[0]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TempleModel>> getTemples() async {
    try {
      final result = await firebaseFirestore
          .collection(FirebaseConstant.templeCollection)
          .get();
      return List<TempleModel>.from(
          result.docs.map((e) => TempleModel.fromQueryDocumentSnapshot(e)));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addTemple(TempleModel temple) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConstant.templeCollection)
          .add(temple.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
