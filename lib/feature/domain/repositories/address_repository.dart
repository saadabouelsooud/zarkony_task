import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';

abstract class AddressRepository
{
  Future<Either<Failure,List<Address>>> getAddresses();
  Future<Either<Failure,Address>> getAddressByName(String name);
}