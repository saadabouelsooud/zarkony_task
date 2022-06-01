import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/feature/domain/entities/categories.dart';

abstract class CategoryRepository
{
  Future<Either<Failure,List<Category>>> getCategories();
  Future<Either<Failure,Category>> getCategoryByName(String name);
}