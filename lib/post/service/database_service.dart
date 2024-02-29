import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  /// Firestoreからすべてのデータを取得
  Stream<List<Map<String, dynamic>>> fetchAllFirebaseData() {
    return db.collection('post').snapshots().map((snapshot) {
      final List<DocumentSnapshot> docs = snapshot.docs;

      // ドキュメントからデータを取得してリストに追加
      List<Map<String, dynamic>> data =
          docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

      // 取得したデータのリストを返す
      return data;
    });
  }

  /// Firestoreにデータを追加
  Future<void> addData(
    String url,
    String country,
    String gender,
    String tpo,
    String season,
  ) async {
    await db.collection("post").add({
      "url": url,
      "country": country,
      "gender": gender,
      'tpo': tpo,
      'season': season,
    });
  }
}

/// データを管理
class SetData extends ChangeNotifier {
  String? country;

  String? gender;

  String? tpo;

  String? season;

  /// 選択された国を設定し、リスナーに通知
  void setCountry(String? newCountry) {
    country = newCountry;
    notifyListeners();
  }

  /// 選択された性別を設定し、リスナーに通知
  void setGender(String? newGender) {
    gender = newGender;
    notifyListeners();
  }

  /// 選択されたTPOを設定し、リスナーに通知
  void setTpo(String? newTpo) {
    tpo = newTpo;
    notifyListeners();
  }

  /// 選択された季節を設定し、リスナーに通知
  void setSeason(String? newSeason) {
    season = newSeason;
    notifyListeners();
  }
}
