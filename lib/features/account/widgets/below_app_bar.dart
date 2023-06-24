import 'package:amazoon_clone/constants/constants.dart';
import 'package:amazoon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: BoxDecoration(
        gradient: GlobalConstants.appBarGradient
      ),
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.black
              ),
              children: [
                TextSpan(
                    text: user.name,
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black
                    )
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
