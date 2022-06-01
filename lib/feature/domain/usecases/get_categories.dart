
import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/entities/categories.dart';
import 'package:zarkony_task/feature/domain/repositories/category_repository.dart';

class GetCategories extends UseCase<List<Category>,NoParams>
{
  final CategoryRepository repository;

  GetCategories(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams noParams) async {
    return await repository.getCategories();
  }
}
