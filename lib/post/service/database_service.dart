import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // Firestoreからすべてのデータを取得する
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

  // Firestoreにデータを追加
  Future<void> addData(String url, String country, String gender, String height,
      String tpo, String season, String temperature, String humidity) async {
    await db.collection("post").add({
      "url": url,
      "country": country,
      "gender": gender,
      'tpo': tpo,
      'season': season,
      'temperature': temperature,
      'humidity': humidity,
      "height": height,
    });
  }
}

class SetData extends ChangeNotifier {
  String? country;
  String? gender;
  String? tpo;
  String? season;

  void setCountry(String? newCountry) {
    country = newCountry;
    notifyListeners();
  }

  void setGender(String? newGender) {
    gender = newGender;
    notifyListeners();
  }

  void setTpo(String? newTpo) {
    tpo = newTpo;
    notifyListeners();
  }

  void setSeason(String? newSeason) {
    season = newSeason;
    notifyListeners();
  }
}
