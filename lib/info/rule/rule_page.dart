import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'text.dart';

class RulePage extends StatelessWidget {
  const RulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Scrollbar(
        radius: const Radius.circular(16),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
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
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  width: 500,
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
                const RuleListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RuleText extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const RuleText({
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
        RuleTitleText(title),
        RuleDescriptionText(description),
        RuleUrl(imageUrl)
      ],
    );
  }
}

//一覧表示
class RuleListView extends StatelessWidget {
  const RuleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: Rules.length,
        itemBuilder: (context, index) {
          final Rule = Rules[index];
          return RuleText(
            title: Rule.title,
            imageUrl: Rule.ImageUrl,
            description: Rule.description,
          );
        },
      ),
    );
  }
}

//　Ruleのタイトルに使うテキスト
class RuleTitleText extends StatelessWidget {
  final String title;

  const RuleTitleText(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.secondaryContainer,
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

//　Ruleの説明に使うテキスト
class RuleDescriptionText extends StatelessWidget {
  final String description;

  const RuleDescriptionText(this.description, {super.key});

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

class RuleUrl extends StatelessWidget {
  final String imageUrl;

  const RuleUrl(this.imageUrl, {super.key});

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
