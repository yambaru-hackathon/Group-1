import 'package:flutter/material.dart';
import 'package:group_1/gift/rank/ranking.dart';
import 'anymore/anymore.dart';
import 'foodgift/food.dart';


class GiftList extends StatelessWidget {
  const GiftList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("お土産",)),
      body:Center(
        child:Column(
          children: [

            
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodGiftPage()),
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
                    child: Text("食べ物")),
              ),


            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnymoreGiftPage()),
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
                    child: Text("雑貨")),
              ),


            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GiftRankPage()),
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
                    child: Text("ランキング")),
              ),
          ],
        ),
          )
    );
  }
}