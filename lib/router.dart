import 'package:amazoon_clone/common/widgets/bottom_bar.dart';
import 'package:amazoon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazoon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName: return MaterialPageRoute(
      settings: routeSettings,
        builder: (_) => AuthScreen()
    );
    case HomeScreen.routeName: return MaterialPageRoute(
      settings: routeSettings,
        builder: (_) => HomeScreen()
    );
    case BottomBar.routeName: return MaterialPageRoute(
      settings: routeSettings,
        builder: (_) => BottomBar()
    );
    default: return MaterialPageRoute(
  settings: routeSettings,
  builder: (_) => Scaffold(
    body: Center(
      child: Text(
        'Screen does not exist'
      ),
    ),
  )
  );
  }
}