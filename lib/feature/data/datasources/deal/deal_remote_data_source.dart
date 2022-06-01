import 'dart:convert';
import 'dart:io';

import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/utils/fixture_reader.dart';
import 'package:zarkony_task/feature/data/models/deal_model.dart';


abstract class DealRemoteDataSource
{
  Future<List<DealModel>> getDeals();
  Future<DealModel> getDealByName(String dealName);

}

class DealRemoteDataSourceImpl implements DealRemoteDataSource
{

  @override
  Future<List<DealModel>> getDeals() async {
    await Future.delayed(Duration(seconds: 3)); // simulate network call

    try {
      final data = await fixture('deals.json');
      final List jsonList = json.decode(data) as List<dynamic>;
      return DealModel().fromJsonList(jsonList);
    } on IOException // simulate server exception
        {
      throw ServerException();
    }
  }

  @override
  Future<DealModel> getDealByName(String dealName) async{
    await Future.delayed(Duration(seconds: 3)); // simulate network call

    try {
      final data = await fixture('deals.json');
      final List jsonList = json.decode(data) as List<dynamic>;
      final dealJsonMap = jsonList.where((element) => element['name'] == dealName) as Map<String,dynamic>;

      return DealModel.fromJsonObject(dealJsonMap);
    } on IOException // simulate server exception
        {
      throw ServerException();
    }
  }

}