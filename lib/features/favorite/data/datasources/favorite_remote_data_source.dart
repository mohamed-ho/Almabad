import 'package:almabad/core/constant/firebase_constant.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/home/data/datasources/temple_remote_data_source.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FavoriteRemoteDataSource {
  Future<bool> isFavorite(String templeId);
  Future<void> addToFavorite(String templeId);
  Future<void> removeFromFavorite(String templeId);
  Future<List<Temple>> getFavoriteTemples();
  Future<List<String>> getFavoriteTemplesIds();
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  FavoriteRemoteDataSourceImpl({required this.firebaseFirestore});
  @override
  Future<void> addToFavorite(String templeId) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConstant.userCollection)
          .doc(ls<LocalDataSource>().getUserData().id)
          .collection(FirebaseConstant.favoriteTempleCollection)
          .doc(templeId)
          .set({'id': templeId});
      final temple = await firebaseFirestore
          .collection(FirebaseConstant.templeCollection)
          .doc(templeId)
          .get();
      await firebaseFirestore
          .collection(FirebaseConstant.templeCollection)
          .doc(templeId)
          .update({
        FirebaseConstant.templeNumberOfLikes:
            temple.get(FirebaseConstant.templeNumberOfLikes) + 1
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Temple>> getFavoriteTemples() async {
    try {
      final templesId = await getFavoriteTemplesIds();
      List<Temple> favoriteTemples = [];
      final allTemples = await ls<TempleRemoteDataSource>().getTemples();
      for (var temple in allTemples) {
        if (templesId.contains(temple.id)) {
          favoriteTemples.add(temple);
        }
      }

      return favoriteTemples;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isFavorite(String templeId) async {
    try {
      final listOfFavoriteTemplesId = await getFavoriteTemplesIds();
      if (listOfFavoriteTemplesId.contains(templeId)) return true;
      return false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeFromFavorite(String templeId) async {
    await firebaseFirestore
        .collection(FirebaseConstant.userCollection)
        .doc(ls<LocalDataSource>().getUserData().id)
        .collection(FirebaseConstant.favoriteTempleCollection)
        .doc(templeId)
        .delete();
    final temple = await firebaseFirestore
        .collection(FirebaseConstant.templeCollection)
        .doc(templeId)
        .get();
    await firebaseFirestore
        .collection(FirebaseConstant.templeCollection)
        .doc(templeId)
        .update({
      FirebaseConstant.templeNumberOfLikes:
          (temple.get(FirebaseConstant.templeNumberOfLikes) - 1)
    });
  }

  @override
  Future<List<String>> getFavoriteTemplesIds() async {
    try {
      final result = await firebaseFirestore
          .collection(FirebaseConstant.userCollection)
          .doc(ls<LocalDataSource>().getUserData().id)
          .collection(FirebaseConstant.favoriteTempleCollection)
          .get();
      return List<String>.from(result.docs.map((e) => e.id));
    } catch (e) {
      rethrow;
    }
  }
}
