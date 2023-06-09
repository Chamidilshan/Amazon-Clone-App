import 'package:amazoon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: GlobalConstants.appBarGradient
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42.0,
                  margin: EdgeInsets.only(left: 15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(7.0),
                    elevation: 1,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 6.0),
                            child: Icon(
                                Icons.search,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(top: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          borderSide: BorderSide.none
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7.0)),
                            borderSide: BorderSide(color: Colors.black38, width: 1.0)
                        ),
                        hintText: 'Search Amazon',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.0
                        )
                      ),
                    ),
                  )
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Icons.mic, color: Colors.black, size: 20.0,),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
