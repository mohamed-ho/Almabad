import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/domain/repositories/temple_reppository.dart';
import 'package:dartz/dartz.dart';

class GetTemplesUsecase {
  final TempleReppository templeReppository;
  GetTemplesUsecase({required this.templeReppository});

  Future<Either<Failure, Temple>> call({required String id}) async {
    return templeReppository.getTemple(id);
  }
}
