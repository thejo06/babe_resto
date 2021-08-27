
import 'package:babe_resto/data/models/screenArgs.dart';
import 'package:babe_resto/ui/bottom_nav.dart';
import 'package:babe_resto/ui/page/restaurant_detail/restaurant_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFFCCC74),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: BottomNavBar.routeName,
      routes: {
        BottomNavBar.routeName: (context) => BottomNavBar(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              args: ModalRoute.of(context)?.settings.arguments as ScreenArguments
            ),
      },
    );
  }
}
