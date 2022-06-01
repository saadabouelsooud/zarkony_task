

import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/entities/offers.dart';
import 'package:zarkony_task/feature/domain/repositories/offer_repository.dart';

class GetOffers implements UseCase<List<Offer>,NoParams>
{
  final OfferRepository repository;

  GetOffers(this.repository);

  @override
  Future<Either<Failure, List<Offer>>> call(NoParams params) async{
    return await repository.getOffers();
  }

}