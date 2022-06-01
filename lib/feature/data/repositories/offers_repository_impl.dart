
import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/network/network_info.dart';
import 'package:zarkony_task/feature/data/datasources/offer/offer_local_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/offer/offer_remote_data_source.dart';
import 'package:zarkony_task/feature/domain/entities/offers.dart';
import 'package:zarkony_task/feature/domain/repositories/offer_repository.dart';

class OfferRepositoryImpl implements OfferRepository
{
  final OfferRemoteDataSource? remoteDataSource;
  final OfferLocalDataSource? localDataSource;
  final NetworkInfo? networkInfo;

  OfferRepositoryImpl({this.remoteDataSource,this.localDataSource,this.networkInfo});

  @override
  Future<Either<Failure, Offer>> getOfferByName(String name) async{
    if (await networkInfo!.isConnected)
    {
      try{
        final deal = await remoteDataSource!.getOfferByName(name);
        return Right(deal);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else
    {
      try{
        final deal = await localDataSource!.getOfferByName(name);
        return Right(deal);
      } on CacheException{return Left(CacheFailure());}
    }
  }

  @override
  Future<Either<Failure, List<Offer>>> getOffers() async{
    try
    {
      final deals = await remoteDataSource!.getOffers();
      return Right(deals);
    } on ServerException
    {
      return Left(ServerFailure());
    }
  }



}



