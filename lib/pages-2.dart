import 'package:flutter/material.dart';

class Pages2 extends StatefulWidget {
  const Pages2({super.key});

  @override
  State<Pages2> createState() => _Pages2State();
}

class _Pages2State extends State<Pages2> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('相場情報'),
      ),
    );
  }
}
