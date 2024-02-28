import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_1/post/service/database_service.dart';
import 'package:group_1/post/service/image_picker_service.dart';

import '../service/storage_service.dart';
import '../widget/category_button_widgets.dart';

final originalImageDataListProvider =
    StateProvider<List<Map<String, dynamic>>>((_) => []);
final filteredImageDataListProvider =
    StateProvider<List<Map<String, dynamic>>>((_) => []);
final countryProvider = StateProvider<String?>((_) => null); // countryのプロバイダー
final genderProvider = StateProvider<String?>((_) => null); // genderのプロバイダー

// 新規投稿ページ
class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  AddPostPageState createState() => AddPostPageState();
}

class AddPostPageState extends State<AddPostPage> {
  final StorageService storageService = StorageService();
  final DatabaseService databaseService = DatabaseService();
  final ImagePickerService imagePickerService = ImagePickerService();
  String? filePath; // nullを返すことがあるので?が付く
  String? country;
  String? gender;
  String? tpo;
  String? season;
  int? temperature;
  int? humidity;
  int? height;

  void setSelectedCountry(String? selectedCountry) {
    setState(() {
      country = selectedCountry;
    });
  }

  void setSelectedGender(String? selectedGender) {
    setState(() {
      gender = selectedGender;
    });
  }

  void setSelectedTPO(String? selectedTPO) {
    setState(() {
      tpo = selectedTPO;
    });
  }

  void setSelectedSeason(String? selectedSeason) {
    setState(() {
      season = selectedSeason;
    });
  }

  void setSelectedHumidity(int? selectedHumidity) {
    setState(() {
      humidity = selectedHumidity;
    });
  }

  void setSelectedTemperature(int? selectedTemperature) {
    setState(() {
      temperature = selectedTemperature;
    });
  }

  void setSelectedHeight(int? selectedHeight) {
    setState(() {
      height = selectedHeight;
    });
  }

  // 画像を選択する
  void pickImage() async {
    final pickedFilePath = await imagePickerService.pickImage();
    if (pickedFilePath != null && pickedFilePath.isNotEmpty) {
      setState(() => filePath = pickedFilePath);
    }
  }

  // 投稿をシェアする
  void sharePost() async {
    // 画像が選択されていない場合の警告
    if (filePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('画像が選択されていません')),
      );
      return;
    }

    // 国が選択されていない場合の警告
    if (country == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('国を選択してください')),
      );
      return;
    }

    try {
      // 画像のアップロード
      String downloadURL = await storageService.uploadImage(filePath!);

      // データベースに追加
      await databaseService.addData(
        downloadURL,
        country!,
        gender ?? '',
        height != null ? height.toString() : '',
        tpo ?? '',
        season ?? '',
        temperature != null ? temperature.toString() : '',
        humidity != null ? humidity.toString() : '',
      );

      // ナビゲーションを閉じる
      Navigator.pop(context);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('新規投稿')),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView(
            children: [
              InkWell(
                onTap: pickImage,
                child: filePath == null
                    ? PlaceholderContainer(screenWidth: screenWidth)
                    : ImageDisplay(
                        file: File(filePath!), screenWidth: screenWidth),
              ),
              Row(
                children: [
                  const Text('国'),
                  CountryDropdownButton(
                    value: country,
                    onChanged: setSelectedCountry,
                    removeOption: false,
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('性別'),
                  GenderDropdownButton(
                      value: gender, onChanged: setSelectedGender),
                ],
              ),
              Row(
                children: [
                  const Text('TPO'),
                  TPODropdownButton(value: tpo, onChanged: setSelectedTPO),
                ],
              ),
              Row(
                children: [
                  const Text('季節'),
                  SeasonDropdownButton(
                      value: season, onChanged: setSelectedSeason),
                ],
              ),
              const Row(
                children: [
                  Text('※時間があればここに気温や湿度を入力できるようにしたい...'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 56),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: sharePost,
          child: const Text('シェア'),
        ),
      ),
    );
  }
}

// 画像を表示する
class ImageDisplay extends StatelessWidget {
  const ImageDisplay({
    super.key,
    required this.file,
    required this.screenWidth,
  });

  final File file;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Image.file(
      file,
      width: screenWidth,
      height: screenWidth,
      fit: BoxFit.cover,
    );
  }
}

// 画像が選択されていない場合に表示されるコンテナ
class PlaceholderContainer extends StatelessWidget {
  const PlaceholderContainer({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_camera,
              color: Colors.grey,
              size: 50,
            ),
            SizedBox(height: 8),
            Text(
              '画像を選択',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
