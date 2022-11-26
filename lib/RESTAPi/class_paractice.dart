import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APiTest extends StatefulWidget {
  const APiTest({super.key});

  @override
  State<APiTest> createState() => _APiTestState();
}

class _APiTestState extends State<APiTest> {
  var data;
  List places = [];
  getApi() async {
    final response =
        await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body.toString());
      setState(() {
        data = body;
        places = data['places'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getApi(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(places[index]['place name']),
                        subtitle: Text(places[index]["longitude"]),
                        leading: Text(data["country"]),
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
