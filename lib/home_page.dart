import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_1/pages-1.dart';
import 'package:group_1/pages-2.dart';
import 'package:group_1/pages-3.dart';
import 'package:group_1/post/page/postview_page.dart';
import 'package:group_1/post/service/database_service.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

import 'component/bottom_navigation.dart';
import 'component/custom_appbar.dart';

class CurrentIndexNotifier extends StateNotifier<int> {
  CurrentIndexNotifier() : super(0);

  void setCurrentIndex(int index) {
    state = index;
  }
}

final currentIndexProvider = StateNotifierProvider<CurrentIndexNotifier, int>(
    (ref) => CurrentIndexNotifier());

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> pages = [
      const Pages1(),
      const Pages2(),
      const Pages3(),
      const PostViewPage(),
    ];

    void onItemTapped(int index) {
      ref.read(currentIndexProvider.notifier).setCurrentIndex(index);
    }

    return MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(create: (_) => SetData()),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'ホーム画面',
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('home'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: pages[ref.watch(currentIndexProvider)],
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: ref.watch(currentIndexProvider),
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
