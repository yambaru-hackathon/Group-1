import 'package:flutter/material.dart';
import 'foodtext.dart';
//import 'package:scroll_to_index/scroll_to_index.dart';

class FoodGiftPage extends StatelessWidget {
  const FoodGiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('お土産'),
        backgroundColor: Color.fromARGB(238, 252, 235, 254),
        
        ),
        body: Scrollbar(
            thumbVisibility: true,
            thickness: 10,
            radius: Radius.circular(16),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FoodGiftListView(),
                      ],
                    ),
                  )
                  ), 
                  );
           
  }
}

class FoodGiftText extends StatelessWidget {
  final String title;
  final String imageUrl;
  const FoodGiftText({
    required this.title,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
            FoodGiftTitleText(title),
            FoodGiftUrl(imageUrl)
        ],
      ),
    );
  }
}
//一覧表示
class FoodGiftListView extends StatelessWidget {
  const FoodGiftListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: FoodGifts.length,
        itemBuilder: (context, index) {
          final FoodGift = FoodGifts[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: FoodGiftText(
              title: FoodGift.title,
              imageUrl: FoodGift.ImageUrl,

            ),
          );
          
        },
      ),
    );
  }
}

//　FoodGiftのタイトルに使うテキスト
class FoodGiftTitleText extends StatelessWidget {
  final String title;
  const FoodGiftTitleText(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(238, 252, 235, 254),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      width: 500,
                      margin: const EdgeInsets.all(8.0),
                      child: Text(title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      );
  }
}

//　FoodGiftの画像に使うテキスト
class FoodGiftUrl extends StatelessWidget {
  final String imageUrl;
  const FoodGiftUrl(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        ),
    );
    
  }
}