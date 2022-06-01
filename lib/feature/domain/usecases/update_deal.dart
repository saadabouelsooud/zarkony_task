

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/data/models/deal_model.dart';
import 'package:zarkony_task/feature/domain/entities/deals.dart';
import 'package:zarkony_task/feature/domain/repositories/deal_repository.dart';

class UpdateDeal implements UseCase<Deal,Params>
{
  final DealRepository repository;

  UpdateDeal(this.repository);

  @override
  Future<Either<Failure, Deal>> call(Params params) async {
    return await repository.updateDeal(params.deal!);
  }

}

class Params extends Equatable
{
  final DealModel? deal;

  Params({this.deal});

  @override
  // TODO: implement props
  List<Object?> get props => [deal];
}