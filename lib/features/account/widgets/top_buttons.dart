import 'package:amazoon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Your Orders', onTap: () {}),
            AccountButton(text: 'Turn Seller', onTap: () {}),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            AccountButton(text: 'Log Out', onTap: () {}),
            AccountButton(text: 'Your Wish List', onTap: () {}),
          ],
        )
      ],
    );
  }
}
