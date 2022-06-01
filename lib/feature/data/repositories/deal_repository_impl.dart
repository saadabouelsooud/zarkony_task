
import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/network/network_info.dart';
import 'package:zarkony_task/feature/data/datasources/deal/deal_local_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/deal/deal_remote_data_source.dart';
import 'package:zarkony_task/feature/data/models/deal_model.dart';
import 'package:zarkony_task/feature/domain/entities/deals.dart';
import 'package:zarkony_task/feature/domain/repositories/deal_repository.dart';

class DealRepositoryImpl implements DealRepository
{
  final DealRemoteDataSource? remoteDataSource;
  final DealLocalDataSource? localDataSource;
  final NetworkInfo? networkInfo;

  DealRepositoryImpl({this.remoteDataSource,this.localDataSource,this.networkInfo});

  @override
  Future<Either<Failure, Deal>> getDealByName(String name) async{
    if (await networkInfo!.isConnected)
    {
      try{
        final deal = await remoteDataSource!.getDealByName(name);
        return Right(deal);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else
    {
      try{
        final deal = await localDataSource!.getDealByName(name);
        return Right(deal);
      } on CacheException{return Left(CacheFailure());}
    }
  }

  @override
  Future<Either<Failure, List<Deal>>> getDeals() async{
    try
    {
      final deals = await remoteDataSource!.getDeals();
      return Right(deals);
    } on ServerException
    {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure,Deal>> updateDeal(DealModel newDeal) async{
      try{
        await localDataSource!.cacheDeal(newDeal);
        return Right(newDeal);
      } on CacheException{return Left(CacheFailure());}
  }


}



