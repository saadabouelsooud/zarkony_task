import 'dart:convert';
import 'dart:io';

import 'package:zarkony_task/core/error/exceptions.dart';
import 'package:zarkony_task/core/utils/fixture_reader.dart';
import 'package:zarkony_task/feature/data/models/Category_model.dart';


abstract class CategoryRemoteDataSource
{
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel> getCategoryByName(String categoryName);

}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource
{

  @override
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(Duration(seconds: 3)); // simulate network call

    try {
      final data = await fixture('categories.json');
      final List jsonList = json.decode(data) as List<dynamic>;
      return CategoryModel().fromJsonList(jsonList);
    } on IOException // simulate server exception
        {
      throw ServerException();
    }
  }

  @override
  Future<CategoryModel> getCategoryByName(String categoryName) async{
    await Future.delayed(Duration(seconds: 3)); // simulate network call

    try {
      final data = await fixture('categories.json');
      final List jsonList = json.decode(data) as List<dynamic>;
      final categoryJsonMap = jsonList.where((element) => element['name'] == categoryName) as Map<String,dynamic>;

      return CategoryModel.fromJsonObject(categoryJsonMap);
    } on IOException // simulate server exception
        {
      throw ServerException();
    }
  }

}