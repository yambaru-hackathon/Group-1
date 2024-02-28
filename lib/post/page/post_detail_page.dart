import 'package:flutter/material.dart';

// 投稿詳細ページ
class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key, required this.imageData});

  final Map<String, dynamic> imageData;

  @override
  PostDetailPageState createState() => PostDetailPageState();
}

class PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE1BEE7),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                const Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                ),
                Expanded(
                  child: ListTile(
                    title: Text(widget.imageData['country'] ?? ''),
                    subtitle: Text(
                      '${widget.imageData['gender'] ?? ''}・${widget.imageData['tpo'] ?? ''}・${widget.imageData['season'] ?? ''}',
                    ),
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.0,
            child: Image.network(
              widget.imageData['url'],
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
