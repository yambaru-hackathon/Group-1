import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// 画像の選択
class ImagePickerService {
  Future<String?> pickImage() async {
    // 画像が選択されるまで処理を待つ
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      // ユーザーが画像を選択しなかった場合は null を返す
      return null;
    }

    //画像を切り抜き縮小圧縮
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      compressQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true, // アスペクト比を固定
        )
      ],
    );

    // トリミングされた画像のパスを返す
    if (croppedFile != null) {
      return croppedFile.path;
    } else {
      return null;
    }
  }
}
