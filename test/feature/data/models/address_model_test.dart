import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:zarkony_task/feature/data/models/address_model.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';

import '../../../fixtures/fixture_reader.dart';

void main()
{
  final addressName = "Home Address";
  final address = "Nozha, Gesr elswis, Cairo Egypt";
  final homeAddress = AddressModel(addressName: addressName,address: address);

  test("should be a subclass of address entity", () async{
    //assert
    expect(homeAddress, isA<Address>());
  });

  group("from json", (){
    test('should return a valid when json contains the matched address', () {
      //arrange
      final List jsonMap = json.decode(fixture('addresses.json')) as List<dynamic>;

      //act
      final result = AddressModel().fromJsonList(jsonMap);

      //assert
      expect(result[0], homeAddress); // passed
      // expect(result[1], homeAddress); // failed

    });
  });

  group("to json", (){
    test('should return json map containing the proper data', () {
      //act
      final result = homeAddress.toJson();

      //assert
      final expectedMap = {"addressName": addressName , "address": address};
      expect(result, expectedMap);

    });
  });

}