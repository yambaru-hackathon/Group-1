import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

// FirebaseStorageからの画像のアップロードとURLの取得
class StorageService {
  // FirebaseStorageへのアクセス
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImage(String? filePath) async {
    // ファイルを指定のパスにアップロード
    final File file = File(filePath!);
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

/// 今は無視していいエラー
/// 「Cloud Storage の設定でFirebase Authentication での認証を得ようとしている」

// E/StorageUtil(17268): error getting token java.util.concurrent.ExecutionException: com.google.firebase.internal.api.FirebaseNoSignedInUserException: Please sign in before trying to get a token.
// W/StorageUtil(17268): Error getting App Check token; using placeholder token instead. Error: com.google.firebase.FirebaseException: No AppCheckProvider installed.
// W/NetworkRequest(17268): no auth token for request
// D/UploadTask(17268): Waiting 0 milliseconds
// E/StorageUtil(17268): error getting token java.util.concurrent.ExecutionException: com.google.firebase.internal.api.FirebaseNoSignedInUserException: Please sign in before trying to get a token.
// W/StorageUtil(17268): Error getting App Check token; using placeholder token instead. Error: com.google.firebase.FirebaseException: No AppCheckProvider installed.
// W/NetworkRequest(17268): no auth token for request
// E/StorageUtil(17268): error getting token java.util.concurrent.ExecutionException: com.google.firebase.internal.api.FirebaseNoSignedInUserException: Please sign in before trying to get a token.
// W/StorageUtil(17268): Error getting App Check token; using placeholder token instead. Error: com.google.firebase.FirebaseException: No AppCheckProvider installed.
// W/NetworkRequest(17268): no auth token for request
