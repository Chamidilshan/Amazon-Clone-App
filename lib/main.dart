import 'dart:js';

import 'package:amazoon_clone/constants/constants.dart';
import 'package:amazoon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazoon_clone/features/auth/services/auth_servide.dart';
import 'package:amazoon_clone/providers/user_provider.dart';
import 'package:amazoon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
          child: const MyApp()
      ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState(){
    final AuthService authService = AuthService();
    super.initState();
  }

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