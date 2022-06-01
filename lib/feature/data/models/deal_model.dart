
import 'package:zarkony_task/feature/domain/entities/deals.dart';

class DealModel extends Deal
{
  DealModel({String? name,String? pieces,String? minutesAway,int? originalPrice,int? discountPrice,bool? isFavourite,String? colorHex})
      : super(name: name,pieces: pieces,minutesAway: minutesAway,originalPrice: originalPrice,discountPrice: discountPrice,isFavourite: isFavourite,colorHex: colorHex);

  factory DealModel.fromJsonObject(Map<String,dynamic> json)
  {
    return DealModel(name: json['name'], pieces: json['pieces'], minutesAway: json['minutesAway'],
        originalPrice: json['originalPrice'],discountPrice: json['discountPrice'],isFavourite: json['isFavourite'],colorHex: json['colorHex']);
  }

  List<DealModel> fromJsonList(List<dynamic> jsonList)
  {
    List<DealModel> list = [];
    jsonList.forEach((element) {
      list.add(DealModel.fromJsonObject(element));
    });
    return list;
  }

  Map<String,dynamic> toJson() {
    return {
      "name" : name ,
      "pieces" : pieces,
      "minutesAway" : minutesAway ,
      "originalPrice" : originalPrice,
      "discountPrice" : discountPrice ,
      "isFavourite" : isFavourite,
      "colorHex" : colorHex
    };
  }
}