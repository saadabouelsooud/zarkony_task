import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/feature/data/models/deal_model.dart';

abstract class DealLocalDataSource
{
  Future<DealModel> getDealByName(String name);
  Future<void> cacheDeal(DealModel dealModel);
}

class DealLocalDataSourceImpl implements DealLocalDataSource
{
  final SharedPreferences? sharedPreferences;

  DealLocalDataSourceImpl({this.sharedPreferences});

  @override
  Future<void> cacheDeal(DealModel dealModel) {
    return sharedPreferences!.setString(dealModel.name!, json.encode(dealModel.toJson()));
  }

  @override
  Future<DealModel> getDealByName(String name) {
    final jsonString = sharedPreferences!.getString(name);
    if(jsonString != null)
    {
      return Future.value(DealModel.fromJsonObject(json.decode(jsonString)));
    }
    else
    {
      throw CacheException();
    }
  }


}