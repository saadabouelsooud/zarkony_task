import 'package:flutter/material.dart';
import 'package:zarkony_task/feature/presentation/view/cart_page.dart';
import 'package:zarkony_task/feature/presentation/view/common/custom_app_bar.dart';
import 'package:zarkony_task/feature/presentation/view/home_page.dart';


class Controller extends StatefulWidget
{
  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    var halfScreenWidth = (MediaQuery.of(context).size.width/2)-25; // circle size

    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            selectedItemColor: Color(0xffD93E11),
            type: BottomNavigationBarType.fixed, // This is all you need!
            items:
            <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.store_mall_directory_outlined ),
                label: 'Grocery',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded),
                label: 'Favourites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Cart',
              ),
            ],
          ),
          Positioned(
            top: -25,
            right: halfScreenWidth,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color:Color(0xffD93E11),
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Stack(
                  children: [
                    Image.asset("assets/images/img_2.png"),
                    Text("\$91",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Builder(
        builder: (BuildContext context)
        {
          if(selectedIndex ==0)
          {
            return MyHomePage();
          }
          else if (selectedIndex == 1)
          {
            return Center(child: Text("News"));
          }
          else if (selectedIndex == 2)
          {
            return Center(child: Text("Favourites"));
          }
          else
          {
            return CartPage();
          }
        },
      ),
    );
  }
}