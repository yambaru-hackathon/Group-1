import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'text.dart';
//import 'package:scroll_to_index/scroll_to_index.dart';

class GiftPage extends StatelessWidget {
  const GiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('シンガポールの常識'),
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
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(238, 252, 235, 254),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        width: 340,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "目次",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const Text(
                              "1.シンガポールではガムの持ち込みが出来ない",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const Text(
                              "2.シンガポールではあれやったら罰金",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const Text(
                              "3.シンガポールでそれはまずい",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const Text(
                              "4.シンガポールでは危ない",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const Text(
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
                            border: Border.all(color: Colors.black)),
                        padding: const EdgeInsets.all(8.0),
                        width: 500,
                        margin: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '関連記事:',
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              TextSpan(
                                text:
                                    '現地で「知らなかった」では済まされない！？　シンガポールに行く前に知っておくべき10のコト',
                                style: TextStyle(color: Colors.lightBlue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://www.singaporenavi.com/special/5058340');
                                  },
                              ),
                            ],
                          ),
                        )
                      ),
                  
                  const GiftListView(),
                  
                  ]),
            )
            ),
            
          
        
      
            );
  }
}

class GiftText extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  const GiftText({
    required this.title,
    required this.description,
    required this.imageUrl,
    //super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
            GiftTitleText(title),
            GiftDescriptionText(description),
            GiftUrl(imageUrl)
        ],
      ),
    );
  }
}
//一覧表示
class GiftListView extends StatelessWidget {
  const GiftListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: Gifts.length,
        itemBuilder: (context, index) {
          final Gift = Gifts[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: GiftText(
              title: Gift.title,
              imageUrl: Gift.ImageUrl,
              description: Gift.description,

            ),
          );
          
        },
      ),
    );
  }
}

//　Giftのタイトルに使うテキスト
class GiftTitleText extends StatelessWidget {
  final String title;
  const GiftTitleText(this.title, {super.key});

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

//　Giftの説明に使うテキスト
class GiftDescriptionText extends StatelessWidget {
  final String description;
  const GiftDescriptionText(this.description, {super.key});

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
class GiftUrl extends StatelessWidget {
  final String imageUrl;
  const GiftUrl(this.imageUrl, {super.key});

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