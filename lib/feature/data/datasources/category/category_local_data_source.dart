import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/feature/data/models/Category_model.dart';

abstract class CategoryLocalDataSource
{
  Future<CategoryModel> getCategoryByName(String name);
  Future<void> cacheCategory(CategoryModel categoryModel);

}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource
{
  final SharedPreferences? sharedPreferences;

  CategoryLocalDataSourceImpl({this.sharedPreferences});

  @override
  Future<void> cacheCategory(CategoryModel categoryModel) {
    return sharedPreferences!.setString(categoryModel.name!, json.encode(categoryModel.toJson()));
  }

  @override
  Future<CategoryModel> getCategoryByName(String name) {
    final jsonString = sharedPreferences!.getString(name);
    if(jsonString != null)
    {
      return Future.value(CategoryModel.fromJsonObject(json.decode(jsonString)));
    }
    else
    {
      throw CacheException();
    }
  }

}