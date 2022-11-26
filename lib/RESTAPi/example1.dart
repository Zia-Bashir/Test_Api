import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_test/model/post_model.dart';

class Example1 extends StatefulWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  List<PostModle> postList = [];
  Future<List<PostModle>> getpost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        postList.add(PostModle.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getpost(),
                //initialData: InitialData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(postList[index].title!),
                        subtitle: Text(postList[index].body!),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
