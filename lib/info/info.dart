import 'package:flutter/material.dart';
import 'package:group_1/info/food/food_page.dart';
import 'package:group_1/info/gift/gift_page.dart';

import '../component/custom_appbar.dart';
import 'rule/rule_page.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(title: '海外情報'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabBar(
              tabs: [
                Tab(text: '食文化'),
                Tab(text: 'お土産'),
                Tab(text: '常識'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FoodPage(),
                  GiftList(),
                  RulePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
