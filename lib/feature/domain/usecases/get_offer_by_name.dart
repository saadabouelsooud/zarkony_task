

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/core/usecases/usecase.dart';
import 'package:zarkony_task/feature/domain/entities/offers.dart';
import 'package:zarkony_task/feature/domain/repositories/offer_repository.dart';
import 'package:zarkony_task/feature/domain/usecases/get_address_by_name.dart';
import 'package:zarkony_task/feature/domain/usecases/get_offers.dart';

class GetOfferByName implements UseCase<Offer, Params>
{
  final OfferRepository repository;

  GetOfferByName(this.repository);

  @override
  Future<Either<Failure, Offer>> call(Params params) async {
    return await repository.getOfferByName(params.offerName!);
  }

}

class Params extends Equatable
{
  final String? offerName;

  Params({this.offerName});

  @override
  // TODO: implement props
  List<Object?> get props => [offerName];
}