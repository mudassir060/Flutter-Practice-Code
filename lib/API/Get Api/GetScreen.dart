import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_practice/API/Get%20Api/PostModel.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  List<PostModel> postData = [];
  Future<List<PostModel>> getPostData() async {
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      // headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      for (var i in parsed) {
        postData.add(PostModel.fromJson(i));
      }
      return postData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPostData(),
          builder: (context, snapshote) {
            if (snapshote.hasData) {
              return ListView.builder(
                itemCount: postData.length,
                itemBuilder: (context, index) {
                return Card(child: Text(postData[index].title.toString()));
              });
            } else {
              return const Text("Loading...");
            }
          }),
    );
  }
}
