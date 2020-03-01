import 'package:flutter/material.dart';
import 'package:flutter_sample_app/app_background.dart';
import 'home_page2.dart';

class CompletedTasks extends StatelessWidget {
  CompletedTasks({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Completed Tasks"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Stack(
        children: <Widget>[
          AppBackgroundPage(),
          ListView.builder(
              itemCount: homePageKey2.currentState.completedItems.length,
              itemBuilder: (BuildContext context, int index) {
                if (homePageKey2.currentState.completedItems[index] == 'true') {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(2.00),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(5.0))),
                        child: ListTile(
                          title:
                              Text(homePageKey2.currentState.listItems[index]),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
