
import 'package:zarkony_task/feature/domain/entities/offers.dart';

class OfferModel extends Offer
{
  OfferModel({String? name,String? availableUntil,double? originalPrice,double? discountPrice})
      : super(name: name,availableUntil: availableUntil,originalPrice: originalPrice,discountPrice: discountPrice);

  factory OfferModel.fromJsonObject(Map<String,dynamic> json)
  {
    return OfferModel(name: json['name'], availableUntil: json['availableUntil'],
        originalPrice: json['originalPrice'],discountPrice: json['discountPrice']);
  }

  List<OfferModel> fromJsonList(List<dynamic> jsonList)
  {
    List<OfferModel> list = [];
    jsonList.forEach((element) {
      list.add(OfferModel.fromJsonObject(element));
    });
    return list;
  }

  Map<String,dynamic> toJson() {
    return {
      "name" : name ,
      "availableUntil" : availableUntil,
      "originalPrice" : originalPrice,
      "discountPrice" : discountPrice ,
    };
  }
}