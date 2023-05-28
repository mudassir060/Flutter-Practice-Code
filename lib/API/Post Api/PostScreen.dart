// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

postData() async {
  try {
    var email;
    var password;
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://marriageapi.pakwexpo.com/public/api/auth/login?email=$email&password=$password'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String value = await response.stream.bytesToString();
      print('====>$value');
    } else {}
  } catch (e) {
    print(e);
  }
}

postBodyData(token, userId, blockId) async {
  try {
    var url = Uri.parse(
        'http://marriageapi.pakwexpo.com/public/api/users/block/remove');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      'user_id': userId.toString(),
      'block_id': blockId.toString(),
    });
    final Map<String, dynamic> data = json.decode(response.body);
    if (response.statusCode == 200) {
    } else {}
    print(data);
  } catch (e) {
    print("=====>$e");
  }
}

Future<void> profileUpdate(context, token, userId) async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  try {
    if (pickedImage != null) {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://marriageapi.pakwexpo.com/public/api/auth/updateProfileImage'));
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });

      var imageFile = File(pickedImage.path);
      request.fields['id'] = userId.toString();

      request.files.add(
          await http.MultipartFile.fromPath('profile_pic', imageFile.path));

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> data = json.decode(responseBody);
      print(data.toString());
      if (response.statusCode == 200) {
      } else {}
    }
  } catch (e) {
    print(e);
  }
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
