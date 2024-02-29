import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/custom_appbar.dart';
import '../service/database_service.dart';
import '../widget/category_button_widgets.dart';
import 'addpost_page.dart';
import 'feed_page.dart';

/// 投稿一覧ページ
class PostViewPage extends StatefulWidget {
  const PostViewPage({super.key});

  @override
  PostViewPageState createState() => PostViewPageState();
}

class PostViewPageState extends State<PostViewPage> {
  late ScrollController scrollController;

  // オリジナルの投稿データリストとフィルター後の投稿データリスト
  late List<Map<String, dynamic>> originalImageDataList = [];
  List<Map<String, dynamic>> filteredImageDataList = [];
  late SetData setData; // データを管理するプロバイダー
  late DatabaseService databaseService; // データベースサービス

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    setData = Provider.of<SetData>(context, listen: false); // プロバイダーの取得
    databaseService = DatabaseService(); // データベースサービスの初期化
    fetchImageData(); // データの取得
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  /// データベースから投稿データを取得するメソッド
  void fetchImageData() {
    databaseService.fetchAllFirebaseData().listen((data) {
      setState(() {
        originalImageDataList = data;
        filter(); // データの取得後、フィルタリングを実行
      });
    }, onError: (e) {
      // エラーハンドリング
    });
  }

  /// 選択された国を設定し、それに応じてフィルタリング
  void setSelectedCountry(String? selectedCountry) {
    setState(() {
      // 選択された国をデータに設定
      setData.setCountry(selectedCountry);
      // フィルタリングを実行
      filter();
    });
  }

  /// 選択された性別を設定し、それに応じてフィルタリング
  void setSelectedGender(String? selectedGender) {
    setState(() {
      // 選択された性別をデータに設定
      setData.setGender(selectedGender);
      // フィルタリングを実行
      filter();
    });
  }

  /// 選択されたTPOを設定し、それに応じてフィルタリング
  void setSelectedTPO(String? selectedTPO) {
    setState(() {
      // 選択されたTPOをデータに設定
      setData.setTpo(selectedTPO);
      // フィルタリングを実行
      filter();
    });
  }

  /// 選択された季節を設定し、それに応じてフィルタリング
  void setSelectedSeason(String? selectedSeason) {
    setState(() {
      // 選択された季節をデータに設定
      setData.setSeason(selectedSeason);
      // フィルタリングを実行
      filter();
    });
  }

  // データのフィルタリングを行うメソッド
  void filter() {
    final country = setData.country;
    final gender = setData.gender;
    final tpo = setData.tpo;
    final season = setData.season;

    filteredImageDataList = originalImageDataList.where((imageData) {
      if (country != null &&
          country != 'すべて' &&
          imageData['country'] != country) {
        return false;
      }
      if (gender != null &&
          gender != '選択しない' &&
          imageData['gender'] != gender) {
        return false;
      }
      if (tpo != null && tpo != '選択しない' && imageData['tpo'] != tpo) {
        return false;
      }
      if (season != null &&
          season != '選択しない' &&
          imageData['season'] != season) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final country = setData.country;
    final gender = setData.gender;
    final tpo = setData.tpo;
    final season = setData.season;

    return Scaffold(
      appBar: const CustomAppBar(title: '現地人のコーデ'),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      // フィルターのリセット
                      setData.setCountry('すべて');
                      setData.setGender(null);
                      setData.setTpo(null);
                      setData.setSeason(null);
                      filter();
                    });
                  },
                  icon: const Icon(Icons.refresh),
                ),
                CountryDropdownButton(
                  value: country,
                  onChanged: setSelectedCountry,
                ),
                GenderDropdownButton(
                  value: gender,
                  onChanged: setSelectedGender,
                ),
                TPODropdownButton(
                  value: tpo,
                  onChanged: setSelectedTPO,
                ),
                SeasonDropdownButton(
                  value: season,
                  onChanged: setSelectedSeason,
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredImageDataList.isNotEmpty
                ? FeedPage(
                    imageDataList: filteredImageDataList, // フィルタリングされたデータを表示
                  )
                : const Center(child: Text('画像が見つかりませんでした')), // データがない場合
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToAddPostPage,
        child: const Icon(Icons.add),
      ),
    );
  }

  // 新規投稿ページへ遷移するメソッド
  void goToAddPostPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPostPage()),
    );
    fetchImageData();
  }
}
