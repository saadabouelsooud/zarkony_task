

import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/entities/deals.dart';
import 'package:zarkony_task/feature/domain/repositories/deal_repository.dart';

class GetDeals implements UseCase<List<Deal>,NoParams>
{
  final DealRepository repository;

  GetDeals(this.repository);

  @override
  Future<Either<Failure, List<Deal>>> call(NoParams params) async{
    return await repository.getDeals();
  }
}
