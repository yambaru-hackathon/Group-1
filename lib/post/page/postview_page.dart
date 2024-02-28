import 'package:flutter/material.dart';
import 'package:group_1/post/page/post_detail_page.dart';
import 'package:provider/provider.dart';

import '../service/database_service.dart';
import '../widget/category_button_widgets.dart';
import 'addpost_page.dart';
import 'filter_page.dart';

// 投稿閲覧ページ
class PostViewPage extends StatefulWidget {
  const PostViewPage({super.key});

  @override
  PostViewPageState createState() => PostViewPageState();
}

class PostViewPageState extends State<PostViewPage> {
  late ScrollController scrollController;

  late List<Map<String, dynamic>> originalImageDataList = [];
  List<Map<String, dynamic>> filteredImageDataList = [];
  late SetData setData;
  late DatabaseService databaseService;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    setData = context.read<SetData>();
    databaseService = DatabaseService();
    _fetchImageData();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _fetchImageData() {
    databaseService.fetchAllFirebaseData().listen((data) {
      setState(() {
        originalImageDataList = data;
        filter();
      });
    }, onError: (e) {
      // error handling
    });
  }

  void setSelectedCountry(String? selectedCountry) {
    setState(() {
      setData.setCountry(selectedCountry);
      filter();
    });
  }

  void setSelectedGender(String? selectedGender) {
    setState(() {
      setData.setGender(selectedGender);
      filter();
    });
  }

  void setSelectedTPO(String? selectedTPO) {
    setState(() {
      setData.setTpo(selectedTPO);
      filter();
    });
  }

  void setSelectedSeason(String? selectedSeason) {
    setState(() {
      setData.setSeason(selectedSeason);
      filter();
    });
  }

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
      if (gender != null && imageData['gender'] != gender) {
        return false;
      }
      if (tpo != null && imageData['tpo'] != tpo) {
        return false;
      }
      if (season != null && imageData['season'] != season) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    setData = context.read<SetData>();
    final country = setData.country;
    final gender = setData.gender;
    final tpo = setData.tpo;
    final season = setData.season;

    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FilterPage()),
                    );
                  },
                  icon: const Icon(Icons.tune),
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
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: filteredImageDataList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostDetailPage(
                                imageData: filteredImageDataList[index],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.network(
                            filteredImageDataList[index]['url'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  )
                : const Center(child: Text('画像が見つかりませんでした')),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToAddPostPage,
        child: const Icon(Icons.add),
      ),
    );
  }

  void goToAddPostPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPostPage()),
    );
    _fetchImageData();
  }
}
