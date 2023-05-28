import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'API/Get Api/GetScreen.dart';
// import 'Provider/provider/countProvider.dart';

void main() {
  // MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider(create: (_) => Counter()),
  //   ],
  //   child: const MyApp(),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetScreen(),
    );
    // return ChangeNotifierProvider(
    //   create: (_) => Counter(),
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: const GetScreen(),
    //   ),
    // );
  }
}
