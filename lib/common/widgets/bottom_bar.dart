import 'package:amazoon_clone/constants/constants.dart';
import 'package:amazoon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42.0;
  double bottomBarBorderWith = 5.0;

  List<Widget> pages = [
    HomeScreen(),
    Center(child: Text('Account Page'),),
    Center(child: Text('Cart Page'),),
  ];

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalConstants.selectedNavBarColor,
        unselectedItemColor: GlobalConstants.unselectedNavBarColor,
        backgroundColor: GlobalConstants.backgroundColor,
        iconSize: 28.0,
        onTap: updatePage,
        items: [
          //HOME PAGE
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 0
                    ? GlobalConstants.selectedNavBarColor
                    : GlobalConstants.backgroundColor,
                width: bottomBarBorderWith
              ))
            ),
            child: Icon(
                Icons.home_outlined
            ),
          ),
            label: ''
          ),
          //PROFILE
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 1
                    ? GlobalConstants.selectedNavBarColor
                    : GlobalConstants.backgroundColor,
                width: bottomBarBorderWith
              ))
            ),
            child: Icon(
                Icons.person_outline_outlined
            ),
          ),
            label: ''
          ),
          //CART
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 2
                    ? GlobalConstants.selectedNavBarColor
                    : GlobalConstants.backgroundColor,
                width: bottomBarBorderWith
              ))
            ),
            child: badges.Badge(
              badgeContent: Text('3'),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.white,
                elevation: 0
              ),
              child: Icon(
                  Icons.shopping_cart_outlined
              ),
            ),
          ),
            label: ''
          )
        ],
      ),
    );
  }
}
