import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_test/model/post_model.dart';

class PostConstroller extends GetxController {
  List<PostModle> postList = [];

  @override
  void onReady() {
    getPost();
    postPost();
    super.onReady();
    print("onready");
  }

  Future<List<PostModle>> getPost() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        postList.add(PostModle.fromJson(i));
        update();
        print("updated");
      }
      return postList;
    } else {
      return postList;
    }
  }

  Future<void> postPost() async {
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      body: {
        "id": 1.toString(),
        "name": "zia".toString(),
        "email": "ziabashir@gmail.com".toString(),
      },
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      print(response.body.toString());
    } else {
      print("fail");
    }
  }
}
