import 'package:emarket/Models/CategoryModel.dart';
import 'package:emarket/Utils/requests_strings.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Data>>(
            future: dioCategoryRequest(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Data item = snapshot.data![index];
                      return Card(
                        child: ListTile(
                            title: Text(item.name!),
                            subtitle: Text(item.slug!)),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.green,));
              } else if (snapshot.hasError) {
                return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                      Icon(Icons.error),
                      Text(
                        "Error",
                        style: TextStyle(color: Colors.red),
                      )
                    ]));
              } else {
                return const Text("Try again");
              }
            }));
  }

  Future<List<Data>> dioCategoryRequest() async {
    var response = await Dio().get(categoryRequest);
    var category = CategoryModel.fromJson(response.data);
    return category.data!;
  }
}
