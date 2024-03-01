import 'package:flutter/material.dart';
import 'package:group_1/component/custom_appbar.dart';

import 'foodtext.dart';

//import 'package:scroll_to_index/scroll_to_index.dart';
class FoodGiftPage extends StatelessWidget {
  const FoodGiftPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'お土産'),
      body: Scrollbar(
        thumbVisibility: true,
        thickness: 10,
        radius: const Radius.circular(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FoodGiftListView(),
            ],
          ),
        ),
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodGiftTitleText(title),
        FoodGiftUrl(imageUrl),
      ],
    );
  }
}

class FoodGiftListView extends StatelessWidget {
  const FoodGiftListView({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: FoodGifts.length,
        itemBuilder: (context, index) {
          final foodGift = FoodGifts[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: FoodGiftText(
              title: foodGift.title,
              imageUrl: foodGift.ImageUrl,
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
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: const EdgeInsets.all(8.0),
      width: 500,
      margin: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
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
