import 'package:flutter/material.dart';
import 'package:flutter_practice/Provider/provider/countProvider.dart';
import 'package:provider/provider.dart';

class providerScreen extends StatefulWidget {
  const providerScreen({super.key});

  @override
  State<providerScreen> createState() => _providerScreenState();
}

class _providerScreenState extends State<providerScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(builder: (context, value, child) {
      return Text(value.count.toString());
    });
  }
}
