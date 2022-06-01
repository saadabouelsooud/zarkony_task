import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';
import 'package:zarkony_task/feature/domain/repositories/address_repository.dart';

class GetAddressByName implements UseCase<Address,Params>{
  final AddressRepository repository;

   GetAddressByName(this.repository);


   // callable classes
  Future<Either<Failure, Address>> call(Params params) async
  {
    return await repository.getAddressByName(params.addressName!);
  }
}

class Params extends Equatable
{
  final String? addressName;

  Params({this.addressName});

  @override
  // TODO: implement props
  List<Object?> get props => [addressName];
}