import 'package:zarkony_task/feature/domain/entities/addresses.dart';

class AddressModel extends Address
{
  AddressModel({String? addressName,String? address}) : super(addressName: addressName,address: address);

  factory AddressModel.fromJsonObject(Map<String,dynamic> json)
  {
    return AddressModel(addressName: json['addressName'], address: json['address']);
  }

  List<AddressModel> fromJsonList(List<dynamic> jsonList)
  {
    List<AddressModel> list = [];
    jsonList.forEach((element) {
      list.add(AddressModel.fromJsonObject(element));
    });
    return list;
  }

  Map<String,dynamic> toJson() {
    return {
      "addressName" : addressName ,
      "address" : address
    };
  }
}