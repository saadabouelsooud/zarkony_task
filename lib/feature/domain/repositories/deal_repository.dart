import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/feature/data/models/deal_model.dart';
import 'package:zarkony_task/feature/domain/entities/deals.dart';

abstract class DealRepository
{
  Future<Either<Failure,List<Deal>>> getDeals();
  Future<Either<Failure,Deal>> getDealByName(String name);
  Future<Either<Failure,Deal>> updateDeal(DealModel deal);
}