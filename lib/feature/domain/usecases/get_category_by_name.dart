import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/entities/categories.dart';
import 'package:zarkony_task/feature/domain/repositories/Category_repository.dart';

class GetCategoryByName implements UseCase<Category,Params>{
  final CategoryRepository repository;

  GetCategoryByName(this.repository);


  // callable classes
  Future<Either<Failure, Category>> call(Params params) async
  {
    return await repository.getCategoryByName(params.categoryName!);
  }
}

class Params extends Equatable
{
  final String? categoryName;

  Params({this.categoryName});

  @override
  // TODO: implement props
  List<Object?> get props => [categoryName];
}