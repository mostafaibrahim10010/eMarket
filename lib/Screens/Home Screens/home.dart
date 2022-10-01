import 'package:emarket/Screens/Home%20Screens/category.dart';
import 'package:emarket/Screens/Home%20Screens/Products/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.green));
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: customAppBar()),
            bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.yellow,
                unselectedLabelColor: Colors.black54,
                tabs: <Widget>[
              Tab(
                child: Container(
                  child: const Text("Category",
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              ),
              Tab(
                child: Container(
                  child: const Text("Products",
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              ),
            ]),
          ),
          body: const TabBarView(children: <Widget>[
            CategoryScreen(),
            ProductsScreen(),
          ]),
        ));
  }
}

customAppBar() {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.horizontal_split),
            color: Colors.blueGrey,
          ),
        ),
        Container(
            child: const Text(
          "Search",
          style: TextStyle(color: Colors.grey),
        )),
        Container(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic),
            color: Colors.blueGrey,
          ),
        ),
      ],
    ),
  );
}
