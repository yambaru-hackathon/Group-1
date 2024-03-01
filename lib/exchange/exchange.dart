import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:group_1/exchange/table.dart';
import 'package:http/http.dart' as http;

import '../component/custom_appbar.dart';

class Exchange extends StatefulWidget {
  const Exchange({super.key});

  @override
  ExchangeState createState() => ExchangeState();
}

class ExchangeState extends State<Exchange> {
  // 入力された金額を保持する変数
  double _amount = 0;
  String _currency = 'JPY';
  double _result = 0;
  final String _apiUrl = 'https://api.exchangerate-api.com/v4/latest/SGD';

  Future<void> _calculate() async {
    double amount = _amount;
    String currency = _currency;

    var uri = Uri.parse(_apiUrl);
    var response = await http.get(uri);

    Map<String, dynamic> data = json.decode(response.body);

    double rate = data['rates'][currency];
    double result = amount * rate;

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: '相場情報'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Text(
                "為替",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.surface,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        _amount = double.tryParse(value) ?? 0;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'シンガポールドルを入力',
                      prefixText: '\$',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButton<String>(
                    value: _currency,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'JPY',
                        child: Text('JPY - 日本円'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'SGD',
                        enabled: false,
                        child: Text('シンガポール・ドル'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _currency = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                    ),
                    onPressed: _calculate,
                    child: const Text('計算', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '換算の結果: $_result$_currencyです',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Text(
                "相場",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "食費",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FoodList(),
              ],
            ),
            const SizedBox(height: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "交通費",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TransportList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
