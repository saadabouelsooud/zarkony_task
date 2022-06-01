import 'package:flutter/material.dart';
import 'package:zarkony_task/feature/domain/entities/deals.dart';

class DealListItem extends StatelessWidget
{
  final Deal _deal;
  DealListItem(this._deal);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Color(0xffE3DDD6),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      // _deal.
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Icon(_deal.isFavourite! ? Icons.favorite :Icons.favorite_border,
                          color: _deal.isFavourite! ? Colors.red: Colors.grey,size: 15),
                    ),
                  )
                ],
              )
          ),
          Container (
            width: 200,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text (_deal.name!, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Flexible(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text (_deal.pieces!),
                ),
                Flexible(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on_outlined,size: 15,),
                      SizedBox(width: 5,),
                      Text(_deal.minutesAway!)
                    ],),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text("\$ ${_deal.discountPrice}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Text("\$ ${_deal.originalPrice}",style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}