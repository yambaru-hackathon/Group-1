import 'package:flutter/material.dart';

import 'ranktext.dart';

class GiftRankPage extends StatelessWidget {
  const GiftRankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Scrollbar(
        thumbVisibility: true,
        thickness: 10,
        radius: Radius.circular(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GiftRankListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class GiftRankText extends StatelessWidget {
  final String no1;
  final String no3;
  final String no2;

  const GiftRankText({
    required this.no1,
    required this.no3,
    required this.no2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GiftRankno1Text(no1, no2, no3),
      ],
    );
  }
}

class GiftRankListView extends StatelessWidget {
  const GiftRankListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: GiftRanks.length,
        itemBuilder: (context, index) {
          final GiftRank = GiftRanks[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: GiftRankText(
              no1: GiftRank.no1,
              no2: GiftRank.no2,
              no3: GiftRank.no3,
            ),
          );
        },
      ),
    );
  }
}

class GiftRankno1Text extends StatelessWidget {
  final String no1;
  final String no2;
  final String no3;

  const GiftRankno1Text(this.no1, this.no2, this.no3, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(238, 252, 235, 254),
      ),
      padding: const EdgeInsets.all(8.0),
      width: 500,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            no1,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            no2,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            no3,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
