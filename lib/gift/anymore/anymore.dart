import 'package:flutter/material.dart';
import 'anymoretext.dart';

class AnymoreGiftPage extends StatelessWidget {
  const AnymoreGiftPage({super.key});

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
                  const AnymoreGiftListView(),
                  
                  ]),
            )
            ),
        );
  }
}

class AnymoreGiftText extends StatelessWidget {
  final String title;
  final String imageUrl;
  const AnymoreGiftText({
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
            AnymoreGiftTitleText(title),
            AnymoreGiftUrl(imageUrl)
        ],
      ),
    );
  }
}
//一覧表示
class AnymoreGiftListView extends StatelessWidget {
  const AnymoreGiftListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: AnymoreGifts.length,
        itemBuilder: (context, index) {
          final AnymoreGift = AnymoreGifts[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: AnymoreGiftText(
              title: AnymoreGift.title,
              imageUrl: AnymoreGift.ImageUrl,
            ),
          );
          
        },
      ),
    );
  }
}

//　AnymoreGiftのタイトルに使うテキスト
class AnymoreGiftTitleText extends StatelessWidget {
  final String title;
  const AnymoreGiftTitleText(this.title, {super.key});

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

//　AnymoreGiftの画像に使うテキスト
class AnymoreGiftUrl extends StatelessWidget {
  final String imageUrl;
  const AnymoreGiftUrl(this.imageUrl, {super.key});

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