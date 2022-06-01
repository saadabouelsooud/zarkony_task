import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/feature/data/models/offer_model.dart';

abstract class OfferLocalDataSource
{
  Future<OfferModel> getOfferByName(String name);
  Future<void> cacheOffer(OfferModel dealModel);

}

class OfferLocalDataSourceImpl implements OfferLocalDataSource
{
  final SharedPreferences? sharedPreferences;

  OfferLocalDataSourceImpl({this.sharedPreferences});

  @override
  Future<void> cacheOffer(OfferModel dealModel) {
    return sharedPreferences!.setString(dealModel.name!, json.encode(dealModel.toJson()));
  }

  @override
  Future<OfferModel> getOfferByName(String name) {
    final jsonString = sharedPreferences!.getString(name);
    if(jsonString != null)
    {
      return Future.value(OfferModel.fromJsonObject(json.decode(jsonString)));
    }
    else
    {
      throw CacheException();
    }
  }

}