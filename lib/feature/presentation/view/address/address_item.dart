

import 'package:flutter/material.dart';
import 'package:zarkony_task/feature/domain/entities/addresses.dart';

class AddressItem extends StatelessWidget
{
  final Address addressModel;
  AddressItem(this.addressModel);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Color(0xffE3DDD6),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
            ),
            Container (
              width: 100,
              child: Column (
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0,top: 8),
                    child: Text (addressModel.addressName!, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0,top: 2),
                    child: Text (addressModel.address!, textAlign: TextAlign.left),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}