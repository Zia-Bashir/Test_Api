import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_test/model/photo_model.dart';

class Example3 extends StatefulWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  List<PhotoModel> photoList = [];
  Future<List<PhotoModel>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        PhotoModel photoModel =
            PhotoModel(id: i['id'], title: i['title'], url: i['url']);
        photoList.add(photoModel);
      }
      return photoList;
    } else {
      return photoList;
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
                future: getPhotos(),
                //initialData: InitialData,
                builder: (BuildContext context,
                    AsyncSnapshot<List<PhotoModel>> snapshot) {
                  return ListView.builder(
                    itemCount: photoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(snapshot.data![index].title.toString()),
                        leading: const CircleAvatar(
                            // backgroundImage: NetworkImage(
                            //     snapshot.data![index].url.toString()),
                            ),
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
