import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/network/network_info.dart';
import 'package:zarkony_task/feature/data/datasources/category/category_local_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/category/category_remote_data_source.dart';
import 'package:zarkony_task/feature/domain/entities/categories.dart';
import 'package:zarkony_task/feature/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository
{

  final CategoryRemoteDataSource? remoteDataSource;
  final CategoryLocalDataSource? localDataSource;
  final NetworkInfo? networkInfo;

  CategoryRepositoryImpl({this.remoteDataSource,this.localDataSource,this.networkInfo});

  @override
  Future<Either<Failure, Category>> getCategoryByName(String name) async{
    if (await networkInfo!.isConnected)
    {
      try{
        final category = await remoteDataSource!.getCategoryByName(name);
        return Right(category);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else
    {
      try{
        final category = await localDataSource!.getCategoryByName(name);
        return Right(category);
      } on CacheException{return Left(CacheFailure());}
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try
    {
      final categories = await remoteDataSource!.getCategories();
      return Right(categories);
    } on ServerException
    {
      return Left(ServerFailure());
    }

  }

}



