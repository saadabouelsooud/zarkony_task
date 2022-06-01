import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/network/network_info.dart';
import 'package:zarkony_task/feature/data/datasources/address/address_local_data_source.dart';
import 'package:zarkony_task/feature/data/datasources/address/address_remote_data_source.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';
import 'package:zarkony_task/feature/domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository
{

  final AddressRemoteDataSource? remoteDataSource;
  final AddressLocalDataSource? localDataSource;
  final NetworkInfo? networkInfo;

  AddressRepositoryImpl({this.remoteDataSource,this.localDataSource,this.networkInfo});

  @override
  Future<Either<Failure, Address>> getAddressByName(String name) async{
    if (await networkInfo!.isConnected)
    {
      try{
        final address = await remoteDataSource!.getAddressByName(name);
        return Right(address);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else
      {
         try{
           final address = await localDataSource!.getAddressByName(name);
           return Right(address);
         } on CacheException{return Left(CacheFailure());}
      }
  }

  @override
  Future<Either<Failure, List<Address>>> getAddresses() async {
        try
            {
              final addresses = await remoteDataSource!.getAddresses();
              return Right(addresses);
            } on ServerException
        {
              return Left(ServerFailure());
        }

  }

}



