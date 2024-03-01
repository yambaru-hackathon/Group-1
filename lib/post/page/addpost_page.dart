import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/database_service.dart';
import '../service/image_picker_service.dart';
import '../service/storage_service.dart';
import '../widget/category_button_widgets.dart';

// データの状態を管理するStateProvider
final countryProvider = StateProvider<String?>((_) => null);
final genderProvider = StateProvider<String?>((_) => null);

/// 新規投稿ページを表すウィジェット
class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  AddPostPageState createState() => AddPostPageState();
}

/// 新規投稿ページの状態を管理するState
class AddPostPageState extends State<AddPostPage> {
  final StorageService storageService = StorageService();
  final DatabaseService databaseService = DatabaseService();
  final ImagePickerService imagePickerService = ImagePickerService();
  String? filePath; // nullを返すことがあるので?が付く
  String? country;
  String? gender;
  String? tpo;
  String? season;

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
      // データベースに追加

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('国'),
                  const SizedBox(width: 8),
                  CountryDropdownButton(
                    value: country,
                    onChanged: setSelectedCountry,
                    removeOption: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('性別'),
                  GenderDropdownButton(
                      value: gender, onChanged: setSelectedGender),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('TPO'),
                  TPODropdownButton(value: tpo, onChanged: setSelectedTPO),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('季節'),
                  SeasonDropdownButton(
                      value: season, onChanged: setSelectedSeason),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('※画像と国は必ず選択してください'),
                  // Text('※時間があればここに気温や湿度を入力できるようにしたい...'),
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

/// 画像を表示する
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

/// 画像が選択されていない場合に表示されるコンテナ
class PlaceholderContainer extends StatelessWidget {
  const PlaceholderContainer({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      child: SizedBox(
        width: screenWidth,
        height: screenWidth,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.photo_camera,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: 50,
              ),
              const SizedBox(height: 8),
              Text(
                '画像を選択',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
