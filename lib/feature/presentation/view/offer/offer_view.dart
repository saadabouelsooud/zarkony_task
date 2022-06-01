

import 'package:flutter/material.dart';

class OfferContainer extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var screenWidth =MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Color(0xffFEC8BD),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Flexible(child: Container(width: screenWidth/2-50,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text("Mega",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                ),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Text("WHOPP",style: TextStyle(color: Color(0xff21114B),fontWeight: FontWeight.w900,fontSize: 30),),
                        Positioned(right: -10,child: SizedBox(child: Text("E",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w900,fontSize: 30),))),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Text("R",style: TextStyle(color: Color(0xff21114B),fontWeight: FontWeight.w900,fontSize: 30),),
                  ],
                ),
                Flexible(child: SizedBox()),
                Row(

                  children: [
                    Text("\$ 17",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),
                    Text("\$ 32",style: TextStyle(color: Colors.white,decoration: TextDecoration.lineThrough)),
                  ],
                ),
                SizedBox(height: 20,),
                Text("* Available until 24 December 2020",style: TextStyle(color: Colors.white),)
              ],
            )
          ],
        ),
      ),
    );
  }

}