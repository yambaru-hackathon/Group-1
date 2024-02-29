import 'package:flutter/material.dart';

import 'component/custom_appbar.dart';
import 'food/food_page.dart';
import 'gift/gift_page.dart';
import 'rule/rule_page.dart';

class Info_Page extends StatelessWidget {
  const Info_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: '海外情報'),
        body: Center(
          child: Column(
            children: [
              // Within the `FirstRoute` widget
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodPage()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(238, 252, 235, 254),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    width: 500,
                    margin: const EdgeInsets.all(8.0),
                    child: Text("食文化")),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GiftList()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(238, 252, 235, 254),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    width: 500,
                    margin: const EdgeInsets.all(8.0),
                    child: Text("お土産")),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RulePage()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(238, 252, 235, 254),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    width: 500,
                    margin: const EdgeInsets.all(8.0),
                    child: Text("常識")),
              ),
            ],
          ),
        ));
  }
}
