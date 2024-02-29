import 'package:flutter/material.dart';

import 'food/food_page.dart';
import 'gift/gift_page.dart';
import 'rule/rule_page.dart';

class Info_Page extends StatelessWidget {
  const Info_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child:Column(
          children: [
            // Within the `FirstRoute` widget
            ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage()), 
                
              );
            }, 
            child: null,
            ),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GiftPage()), 
                
              );
            }, 
            child: null,
            ),ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RulePage()), 
                
              );
            }, 
            child: null,
            ),
          ],

        ),
          )
    );
  }
}