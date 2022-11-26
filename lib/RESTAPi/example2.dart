import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_test/model/comments_model.dart';

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  List<CommetModel> commentsList = [];
  Future<List<CommetModel>> getComment() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        commentsList.add(CommetModel.fromJson(i));
      }
      return commentsList;
    } else {
      return commentsList;
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
                future: getComment(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    itemCount: commentsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(commentsList[index].email!),
                        subtitle: Text(commentsList[index].body!),
                        leading: Text(commentsList[index].id!.toString()),
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
