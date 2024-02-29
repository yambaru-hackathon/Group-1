import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_1/pages-2.dart';
import 'package:group_1/pages-3.dart';
import 'package:group_1/post/page/post_view_page.dart';
import 'package:group_1/post/service/database_service.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

import 'component/custom_bottom_navigation.dart';

/// ボトムナビゲーションの状態管理
class CurrentIndexNotifier extends StateNotifier<int> {
  CurrentIndexNotifier() : super(0);

  // 現在のインデックスをセットする
  void setCurrentIndex(int index) {
    state = index;
  }
}

// 現在のインデックスを提供するStateNotifierProvider
final currentIndexProvider =
    StateNotifierProvider<CurrentIndexNotifier, int>((ref) {
  return CurrentIndexNotifier();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ページのリスト
    const List<Widget> pages = [
      Pages2(),
      Pages3(),
      PostViewPage(), // 現地人のコーデ
    ];

    // ボトムナビゲーションアイテムがタップされた時の処理
    void onItemTapped(int index) {
      ref
          .read(currentIndexProvider.notifier)
          .setCurrentIndex(index); // インデックスを更新
    }

    return MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(create: (_) => SetData()), // データのセットアップ
      ],
      child: Scaffold(
        body: pages[ref.watch(currentIndexProvider)], // 現在のインデックスに応じたページを表示
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: ref.watch(currentIndexProvider), // 現在のインデックスを反映
          onTap: onItemTapped, // アイテムがタップされた時の値を返す
        ),
      ),
    );
  }
}
