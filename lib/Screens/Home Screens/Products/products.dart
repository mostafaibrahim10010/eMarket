import 'package:dio/dio.dart';
import 'package:emarket/Screens/Home%20Screens/Products/productDetails.dart';
import 'package:emarket/Utils/requests_strings.dart';
import 'package:flutter/material.dart';

import '../../../Models/ProductsModel.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Data>>(
            future: dioProductsRequest(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                ));
              } else if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Data item = snapshot.data![index];
                      return Card(
                          child: ListTile(
                        onTap: () {
                          if (item.title == "running sneaker") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ProductDetail()));
                          } else {}
                        },
                        title: Text(item.title!),
                        subtitle: Text(item.slug!),
                      ));
                    });} else if (snapshot.hasError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.error),
                    Text(
                      "Error",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ));
              } else {
                return const Text("data");
              }
            }));
  }

  Future<List<Data>> dioProductsRequest() async {
    var response = await Dio().get(productsRequest);
    var product = ProductsModel.fromJson(response.data);
    return product.data!;
  }
}
