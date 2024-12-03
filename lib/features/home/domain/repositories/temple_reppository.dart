import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:dartz/dartz.dart';

abstract class TempleReppository {
  Future<Either<Failure, List<Temple>>> getTemples();
  Future<Either<Failure, Temple>> getTemple(String id);
}
