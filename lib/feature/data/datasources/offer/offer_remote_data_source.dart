import 'dart:convert';
import 'dart:io';

import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/utils/fixture_reader.dart';
import 'package:zarkony_task/feature/data/models/offer_model.dart';


abstract class OfferRemoteDataSource
{
  Future<List<OfferModel>> getOffers();
  Future<OfferModel> getOfferByName(String dealName);

}

class OfferRemoteDataSourceImpl implements OfferRemoteDataSource
{

  @override
  Future<List<OfferModel>> getOffers() async {
    await Future.delayed(Duration(seconds: 3)); // simulate network call

    try {
      final data = await fixture('offers.json');
      final List jsonList = json.decode(data) as List<dynamic>;
      return OfferModel().fromJsonList(jsonList);
    } on IOException // simulate server exception
        {
      throw ServerException();
    }
  }

  @override
  Future<OfferModel> getOfferByName(String dealName) async{
    await Future.delayed(Duration(seconds: 3)); // simulate network call

    try {
      final data = await fixture('offers.json');
      final List jsonList = json.decode(data) as List<dynamic>;
      final dealJsonMap = jsonList.where((element) => element['name'] == dealName) as Map<String,dynamic>;

      return OfferModel.fromJsonObject(dealJsonMap);
    } on IOException // simulate server exception
        {
      throw ServerException();
    }
  }

}