import 'dart:convert';
import 'dart:io';

import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/utils/fixture_reader.dart';
import 'package:zarkony_task/feature/data/models/address_model.dart';


abstract class AddressRemoteDataSource
{
  Future<List<AddressModel>> getAddresses();
  Future<AddressModel> getAddressByName(String addressName);

}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource
{

  @override
  Future<List<AddressModel>> getAddresses() async {
    await Future.delayed(Duration(seconds: 3)); // simulate network call

    try {
      final data = await fixture('addresses.json');
      final List jsonList =  json.decode(data) as List<dynamic>;
      return AddressModel().fromJsonList(jsonList);
    } on IOException // simulate server exception
    {
      throw ServerException();
    }
  }

  @override
  Future<AddressModel> getAddressByName(String addressName) async{
    await Future.delayed(Duration(seconds: 3)); // simulate network call

    try {
      final data = await fixture('addresses.json');
      final List jsonList =  json.decode(data) as List<dynamic>;
      final addressJsonMap = jsonList.where((element) => element['addressName'] == addressName) as Map<String,dynamic>;

      return AddressModel.fromJsonObject(addressJsonMap);
    } on IOException // simulate server exception
        {
      throw ServerException();
    }
  }

}