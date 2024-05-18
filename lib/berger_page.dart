import 'package:flutter/material.dart';

class BergerPage extends StatefulWidget {
  static const tag = "Burger_Page";

  const BergerPage({super.key});
  @override
  State<BergerPage> createState() => _BergerPageState();
}

class _BergerPageState extends State<BergerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
