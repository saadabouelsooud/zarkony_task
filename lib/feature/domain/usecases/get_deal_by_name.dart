

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/entities/deals.dart';
import 'package:zarkony_task/feature/domain/repositories/deal_repository.dart';

class GetDealByName implements UseCase<Deal,Params>
{
  final DealRepository repository;

  GetDealByName(this.repository);

  @override
  Future<Either<Failure, Deal>> call(Params params) async {
    return await repository.getDealByName(params.dealName!);
  }

}

class Params extends Equatable
{
  final String? dealName;

  Params({this.dealName});

  @override
  // TODO: implement props
  List<Object?> get props => [dealName];
}