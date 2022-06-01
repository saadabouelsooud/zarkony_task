

import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';
import 'package:zarkony_task/feature/domain/repositories/address_repository.dart';

class GetAddresses implements UseCase<List<Address>,NoParams>
{
  final AddressRepository repository;

  GetAddresses(this.repository);

  // callable classes
  @override
  Future<Either<Failure, List<Address>>> call(NoParams noParams) async {
    return await repository.getAddresses();
  }
}
