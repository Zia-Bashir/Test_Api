import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_test/controller/post_controller.dart';

class PostGetx extends GetView<PostConstroller> {
  const PostGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 200,
              width: double.maxFinite,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.postList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(controller.postList[index].title.toString()),
                    subtitle: Text(controller.postList[index].body.toString()),
                    leading: Text(controller.postList[index].id.toString()),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
