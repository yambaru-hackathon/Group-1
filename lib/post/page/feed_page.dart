import 'package:flutter/material.dart';

import 'feed_detail_page.dart';

/// フィードページを表すウィジェット
class FeedPage extends StatelessWidget {
  final List<Map<String, dynamic>> imageDataList; // 投稿データのリスト

  const FeedPage({
    super.key,
    required this.imageDataList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 横方向のアイテム数
        childAspectRatio: 1.0, // アスペクト比
      ),
      itemCount: imageDataList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // 詳細ページに遷移
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FeedDetailPage(
                  imageData: imageDataList[index], // タップされたアイテムのデータを詳細ページに渡す
                );
              }),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Image.network(
                  imageDataList[index]['url'],
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
