import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarkony_task/feature/presentation/view/address/address_list.dart';
import 'package:zarkony_task/feature/presentation/view/category/category_list.dart';
import 'package:zarkony_task/feature/presentation/view/deal/deal_list.dart';
import 'package:zarkony_task/feature/presentation/view/offer/offer_view.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var halfScreenWidth = (MediaQuery.of(context).size.width/2)-25; // circle size

    return Scaffold(
      body: ListView(
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20,),
          CustomSearchView(),
          SizedBox(height: 20,),
          AddressHorizontalList(),
          SizedBox(height: 20,),
          CategoriesHorizontalList(),
          DealHorizontalList(),
          OfferContainer(),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}

class CustomSearchView extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height:40 ,
            decoration: BoxDecoration(
              color: Color(0xfff5f7f9),
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              Text('Search in thousands of products'),
            ],
          ),
        ],
      )
    );
  }

}
