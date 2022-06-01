import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 140,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Stack(
                      children: [
                        Image.asset("assets/images/img.png"),
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(Icons.location_on_outlined),
                          ),
                          Text("Mustafa St.")
                        ],)
                      ],
                    ))),
          ],
        ),
      ),
      actions: [Padding(
        padding: const EdgeInsets.only(right: 8.0,top: 2,bottom: 2),
        child: Container(height: 50,width: 50,decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            shape: BoxShape.circle
        )),
      )],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
