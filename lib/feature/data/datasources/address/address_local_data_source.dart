import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/feature/data/models/address_model.dart';

abstract class AddressLocalDataSource
{
  Future<AddressModel> getAddressByName(String name);
  Future<void> cacheAddress(AddressModel addressModel);

}

class AddressLocalDataSourceImpl implements AddressLocalDataSource
{
  final SharedPreferences? sharedPreferences;

  AddressLocalDataSourceImpl({this.sharedPreferences});

  @override
  Future<void> cacheAddress(AddressModel addressModel) {
    return sharedPreferences!.setString(addressModel.addressName!, json.encode(addressModel.toJson()));
  }

  @override
  Future<AddressModel> getAddressByName(String name) {
    final jsonString = sharedPreferences!.getString(name);
    if(jsonString != null)
      {
        return Future.value(AddressModel.fromJsonObject(json.decode(jsonString)));
      }
    else
      {
        throw CacheException();
      }
  }

}