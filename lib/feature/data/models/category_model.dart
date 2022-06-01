
import 'package:zarkony_task/feature/domain/entities/categories.dart';

class CategoryModel extends Category
{
  CategoryModel({String? name,String? colorHex}) : super(name: name,colorHex: colorHex);

  factory CategoryModel.fromJsonObject(Map<String,dynamic> json)
  {
    return CategoryModel(name: json['name'], colorHex: json['colorHex']);
  }

  List<CategoryModel> fromJsonList(List<dynamic> jsonList)
  {
    List<CategoryModel> list = [];
    jsonList.forEach((element) {
      list.add(CategoryModel.fromJsonObject(element));
    });
    return list;
  }

  Map<String,dynamic> toJson() {
    return {
      "name" : name ,
      "colorHex" : colorHex
    };
  }
}