import 'package:dio/dio.dart';
import 'package:emarket/Models/ProductDetailsModel.dart';
import 'package:emarket/Utils/requests_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.green));
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "New Product",
            style: TextStyle(color: Colors.white70),
          ),
          backgroundColor: Colors.green),
      body: Center(
        child: FutureBuilder<Data>(
            future: dioProductDetailRequest(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.green,
                ));
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
                  ],
                ));
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data!.title!,
                            style: const TextStyle(fontSize: 30)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Image.asset("assets/sneakers.jpg"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "EGP ${snapshot.data!.price}",
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 170,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  primary: Colors.lightGreen,
                                  textStyle: const TextStyle(fontSize: 20)),
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          height: 60,
                          width: 170,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  primary: Colors.green,
                                  textStyle: const TextStyle(fontSize: 20)),
                              child: const Text(
                                "Buy Now",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Seller: ${snapshot.data!.createdBy!.name}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Company: ${snapshot.data!.createdBy!.role}",
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Category: ${snapshot.data!.category!.name}",
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ));
              } else {
                return const Text("data");
              }
            }),
      ),
    );
  }

  Future<Data> dioProductDetailRequest() async {
    var response = await Dio().get(productsDetailsRequest);
    var productDetail = ProductDetailsModel.fromJson(response.data);
    return productDetail.data!;
  }
}
