import 'package:amazoon_clone/constants/constants.dart';
import 'package:amazoon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazoon_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalConstants.backgroundColor,
        colorScheme: ColorScheme.light(
          primary: GlobalConstants.secondaryColor
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)
        )
      ),
      onGenerateRoute: (settings) =>generateRoute(settings),
      home: AuthScreen()
    );
  }
}