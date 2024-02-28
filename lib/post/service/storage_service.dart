import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

// FirebaseStorageからの画像のアップロードとURLの取得
class StorageService {
  // FirebaseStorageへのアクセス
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImage(String? filePath) async {
    if (filePath == null) {
      throw ArgumentError('File path cannot be null');
    }
    // ファイルを指定のパスにアップロード
    final File file = File(filePath);
    final String storagePath = 'post/${basename(file.path)}';

    // metadataのcontentTypeを画像（post/png）に指定する。
    final metadata = SettableMetadata(contentType: 'post/png');

    await storage.ref(storagePath).putFile(file, metadata);

    // アップロードされた画像のダウンロードURLを取得
    String downloadURL =
        await storage.ref('post/${basename(file.path)}').getDownloadURL();

    // ダウンロードURL
    return downloadURL;
  }
}
