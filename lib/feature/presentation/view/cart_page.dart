import 'package:flutter/material.dart';
import 'package:zarkony_task/feature/presentation/view/home_page.dart';

class CartPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var halfScreenWidth = (MediaQuery.of(context).size.width/2)-25; // circle size

    return Scaffold(
      body: Column(
        children: [
          SizedBox(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 20);
                },
                shrinkWrap: true,
                itemCount: 5 ,
                itemBuilder: (BuildContext context, int index) {
                  {
                    return CartListItem();
                  }
                }),
          )
        ],
      ),
    );
  }

}

class CartListItem extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // var halfScreenWidth = MediaQuery.of(context).size.width/2;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // width: halfScreenWidth,
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
                      )
                  ),
                  Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text ("Turkish Steak", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text ("173 Grams",style: TextStyle(color: Colors.grey),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("\$ 12",style: TextStyle(color: Color(0xffB13E55),fontWeight: FontWeight.bold,fontSize: 30),),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                     width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xffB0EAFD),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Icon(Icons.remove_rounded,color: Color(0xff47B6DA),),
                  ),
                  SizedBox(width: 15,),
                  Text("3",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  SizedBox(width: 15,),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xffB0EAFD),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Icon(Icons.add_rounded,color: Color(0xff47B6DA),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}