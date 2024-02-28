import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
   FoodList({super.key});

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
                 TableRow(children: [
                    Text("場所"),
                    Text("説明"),
                    Text("価格帯"),
                  ],
                  decoration: BoxDecoration(color:Color.fromARGB(238, 252, 235, 254)),
                  ),
                  TableRow(children: [
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("レストラン")),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
                      ),
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("150~300\$"),
                      ),
                    
                  ]),
                  TableRow(children: [
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("レストラン")),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
                      ),
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("150~300\$"),
                      ),
                    
                  ]),
                  TableRow(children: [
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("レストラン")),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
                      ),
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("150~300\$"),
                      ),
                    
                  ]),
                  TableRow(children: [
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("レストラン")),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
                      ),
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("150~300\$"),
                      ),
                    
                  ]),
                

                ]
                )
                ;
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
                  TableRow(children: [
                    Text("場所"),
                    Text("説明"),
                    Text("価格帯"),
                  ],
                  decoration: BoxDecoration(color:Color.fromARGB(238, 252, 235, 254)),
                  ),
                  TableRow(children: [
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("レストラン")),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
                      ),
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("150~300\$"),
                      ),
                    
                  ]),
                  TableRow(children: [
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("レストラン")),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
                      ),
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("150~300\$"),
                      ),
                    
                  ]),
                  TableRow(children: [
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("レストラン")),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
                      ),
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("150~300\$"),
                      ),
                    
                  ]),
                  TableRow(children: [
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("レストラン")),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ホーカーと比べると値段は跳ねあがり日本でのレストランの感覚でいくとその値段の高さに驚く。"),
                      ),
                    Container(
                      padding:EdgeInsets.all(8.0),
                      child: Text("150~300\$"),
                      ),
                    
                  ]),
                ]);
  }
}