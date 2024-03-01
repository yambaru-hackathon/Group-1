import 'package:flutter/material.dart';
import 'package:group_1/component/custom_appbar.dart';

/// 投稿詳細ページを表すウィジェット
class FeedDetailPage extends StatefulWidget {
  const FeedDetailPage({super.key, required this.imageData});

  final Map<String, dynamic> imageData; // 投稿の情報を受け取るためのマップデータ

  @override
  FeedDetailPageState createState() => FeedDetailPageState();
}

/// 投稿詳細ページの状態を管理するState
class FeedDetailPageState extends State<FeedDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '投稿の詳細',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                const Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('UserID'),
                    subtitle: Text(
                      '${widget.imageData['country'] ?? ''} ${widget.imageData['gender'] != null && widget.imageData['gender'] != '選択しない' ? widget.imageData['gender'] : ''} ${widget.imageData['season'] != null && widget.imageData['season'] != '選択しない' ? widget.imageData['season'] : ''} ${widget.imageData['tpo'] != null && widget.imageData['tpo'] != '選択しない' ? widget.imageData['tpo'] : ''}',
                    ),
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.0, // 画像のアスペクト比を維持
            child: Image.network(
              widget.imageData['url'], // 投稿画像のURL
              fit: BoxFit.cover, // 画像を親要素に合わせて表示
            ),
          ),
        ],
      ),
    );
  }
}
