import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'text.dart';
//import 'package:scroll_to_index/scroll_to_index.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                padding: const EdgeInsets.all(10.0),
                width: 340,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "目次",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "1.シンガポールではガムの持ち込みが出来ない",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "2.シンガポールではあれやったら罰金",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "3.シンガポールでそれはまずい",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "4.シンガポールでは危ない",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "5.シンガポールでは常識や",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '関連記事:',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    TextSpan(
                      text: '現地で「知らなかった」では済まされない！？　シンガポールに行く前に知っておくべき10のコト',
                      style: const TextStyle(
                        color: Colors.lightBlue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(
                              'https://www.singaporenavi.com/special/5058340');
                        },
                    ),
                  ],
                ),
              ),
            ),
            const FoodListView(),
          ],
        ),
      ),
    );
  }
}

class FoodText extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const FoodText({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodTitleText(title),
        FoodDescriptionText(description),
        FoodUrl(imageUrl),
      ],
    );
  }
}

//一覧表示
class FoodListView extends StatelessWidget {
  const FoodListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: Foods.length,
        itemBuilder: (context, index) {
          final Food = Foods[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: FoodText(
              title: Food.title,
              imageUrl: Food.ImageUrl,
              description: Food.description,
            ),
          );
        },
      ),
    );
  }
}

//　Foodのタイトルに使うテキスト
class FoodTitleText extends StatelessWidget {
  final String title;

  const FoodTitleText(this.title, {super.key});

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

//　Foodの説明に使うテキスト
class FoodDescriptionText extends StatelessWidget {
  final String description;

  const FoodDescriptionText(this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}

class FoodUrl extends StatelessWidget {
  final String imageUrl;

  const FoodUrl(this.imageUrl, {super.key});

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
