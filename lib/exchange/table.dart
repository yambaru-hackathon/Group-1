import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(200.0),
        2: FixedColumnWidth(100.0),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: [
        TableRow(
          children: const [
            Text("場所"),
            Text("説明"),
            Text("価格帯"),
          ],
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("レストラン"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("150~300\$"),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("レストラン"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("150~300\$"),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("レストラン"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("150~300\$"),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("レストラン"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("150~300\$"),
            ),
          ],
        ),
      ],
    );
  }
}

class TransportList extends StatelessWidget {
  const TransportList({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(200.0),
        2: FixedColumnWidth(100.0),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: [
        TableRow(
          children: const [
            Text("場所"),
            Text("説明"),
            Text("価格帯"),
          ],
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("レストラン"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("150~300\$"),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("レストラン"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("150~300\$"),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("レストラン"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("150~300\$"),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("レストラン"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("150~300\$"),
            ),
          ],
        ),
      ],
    );
  }
}
