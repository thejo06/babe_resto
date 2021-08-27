import 'package:babe_resto/data/services/api_services.dart';
import 'package:babe_resto/provider/restaurant_detail_provider.dart';
import 'package:babe_resto/provider/restaurant_list_provider.dart';
import 'package:babe_resto/ui/page/restaurant_home/restaurant_home.dart';
import 'package:babe_resto/ui/page/restaurant_search/restaurant_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  static const routeName = '/restauran_home';

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _bottomNavIndex = 0;

  List<Widget> _listWidget = [
    RestaurantHomePage(),
    RestaurantSearch(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
