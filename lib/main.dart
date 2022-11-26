import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_test/RESTAPi/class_paractice.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Get.put(PostConstroller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const APiTest(),
    );
  }
}
