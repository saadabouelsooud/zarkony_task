import 'package:dartz/dartz.dart';
import 'package:zarkony_task/core/error/failure.dart';
import 'package:zarkony_task/feature/domain/entities/offers.dart';

abstract class OfferRepository
{
  Future<Either<Failure,List<Offer>>> getOffers();
  Future<Either<Failure,Offer>> getOfferByName(String name);
}