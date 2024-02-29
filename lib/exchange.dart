import 'package:flutter/material.dart';
import 'package:group_1/table.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: '誕生年リスト'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  // 入力された金額を保持する変数
  double _amount = 0;
  // コンボボックスで選択された通貨の種類を保持する変数
  String? _currency = 'SGD';

  // 両替された円の金額を保持する変数
  double _result = 0;

  // 為替レートを取得するAPIのURL
  String _apiUrl = 'https://api.exchangerate-api.com/v4/latest/SGD';

  // 計算ボタンが押されたときの処理
  void _calculate() async {
    // 入力された金額を取得する
    double amount = _amount;

    // コンボボックスで選択された通貨の種類を取得する
    String? currency = _currency;

    // uriにパースする
    var uri = Uri.parse(_apiUrl);

    // APIを使って、為替レートを取得する
    var response = await http.get(uri);

    // APIから返されたJSONをパースする
    Map<String, dynamic> data = json.decode(response.body);

    // 為替レートを取得する
    double rate = data['rates'][currency];

    // 入力された金額を円に両替する
    double result = amount * rate;

    // 両替された円の金額を保存する
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日本円との相場'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(238, 252, 235, 254),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black12,
                      offset: Offset(5, 5)
                    ),],
                ),
                child: Text(
                  "為替",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(238, 252, 235, 254),
                ),
                child: Column(
                  children: [
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        setState(() {
                          _amount = double.parse(value);
                        });
                      },
                      decoration:
                          InputDecoration(labelText: 'シンガポールドルを入力', prefixText: '\$'),
                    ),
                    DropdownButton(
                      value: _currency,
                      items: [
                        // DropdownMenuItem(
                        //   value: 'AED',
                        //   child: Text('AED - UAEディルハム'),
                        // ),
                        // DropdownMenuItem(
                        //   value: 'THB',
                        //   child: Text('THB - タイバーツ'),
                        // ),
                        // DropdownMenuItem(
                        //   value: 'IDR',
                        //   child: Text('IDR - インドネシアルピー'),
                        // ),
                        // DropdownMenuItem(
                        //   value: 'MYR',
                        //   child: Text('MYR - マレーシアリンギット'),
                        // ),
                         DropdownMenuItem(
                           value: 'PHP',
                           child: Text('フィリピン・ペソ'),
                         ),
                        // DropdownMenuItem(
                        //   value: 'NZD',
                        //   child: Text('NZD - ニュージーランドドル'),
                        // ),
                        // DropdownMenuItem(
                        //   value: 'VND',
                        //   child: Text('VND - ベトナムドン'),
                        // ),
                        DropdownMenuItem(
                          value: 'SGD',
                          child: Text('シンガポール・ドル(選べません)',
                              style: TextStyle(backgroundColor: Colors.grey)),
                          enabled: false,
                        ),
                        DropdownMenuItem(
                          value: 'JPY',
                          child: Text(
                            'JPY - 日本円',
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _currency = value;
                        });
                      },
                    ),
                    SizedBox(height: 80),
                    ElevatedButton(
                      child: Text('計算',style:TextStyle(fontSize:30)),
                      onPressed: _calculate,
                      
                      
                    ),
                    SizedBox(height: 10),
                    Text('換算の結果: $_result$_currencyです',
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(238, 252, 235, 254),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black12,
                      offset: Offset(5, 5)
                    ),]
                ),
                child: Text(
                  "相場",
                  style: TextStyle(fontSize: 30,),
                ),
              ),
              Text("食費",
              style:TextStyle(fontSize: 20,),
              ),
              FoodList(),
              SizedBox(height: 40,),
              Text("交通費",
              style:TextStyle(fontSize: 20,),
              ),
              TransportList(),
            ],
          ),
        ),
      ),
    );
  }
}