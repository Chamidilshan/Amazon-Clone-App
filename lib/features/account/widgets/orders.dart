import 'package:amazoon_clone/constants/constants.dart';
import 'package:amazoon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List list = [
      'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
      'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
      'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
      'https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              child: const Text(
                  'Your Orders',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15.0),
              child:  Text(
                  'See All',
                style: TextStyle(
                  color: GlobalConstants.selectedNavBarColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 170.0,
          padding: EdgeInsets.only(left: 10.0, right: 0, top: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
              itemBuilder: ((context, index) {
                return SingleProduct(image: list[index]);
              })
          ),
        )
      ],
    );
  }
}
