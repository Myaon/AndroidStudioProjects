import 'package:flutter/material.dart';
import 'package:flutter_sample_app/home_page2.dart';
import 'home_page.dart';
import 'home_page1.dart';
import 'home_page2.dart';
import 'home_page3.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_walk)),
              ],
            ),
            title: Text('TabTask'),
          ),
          body: TabBarView(
            children: [
              HomePage(key: homePageKey),
              HomePage1(key: homePageKey1),
              HomePage2(key: homePageKey2),
              HomePage3(key: homePageKey3),
            ],
          ),
        ),
      ),
    );
  }
}
