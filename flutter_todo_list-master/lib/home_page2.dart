import 'package:flutter/material.dart';
import 'package:flutter_sample_app/shared_prefs.dart';
import 'app_background.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

var homePageKey2 = GlobalKey<_HomePageState2>();

class HomePage2 extends StatefulWidget {
  const HomePage2({Key key}) : super(key: key);

  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  List<String> listItems2 = [];

  bool _validate = false;

  final TextEditingController eCtrl = TextEditingController();

  final PageController controller = PageController(
    initialPage: 1,
  );

  void _init() async {
    await SharePrefs2.setInstance();
    listItems2 = SharePrefs2.getListItems();
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    eCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Urgent But Not Important"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: <Widget>[
          AppBackgroundPage(),
          PageView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.7),
                        color: Colors.white),
                    margin: EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: eCtrl,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Things to do",
                              errorText:
                              _validate ? 'The input is empty.' : null,
                              contentPadding: const EdgeInsets.only(
                                  left: 25.0, bottom: 15.0, top: 15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                            autocorrect: true,
                            onSubmitted: (text) {
                              if (text.isEmpty) {
                                _validate = true;
                                setState(() {});
                              } else {
                                _validate = false;
                                listItems2.add(text);
                                SharePrefs2.setListItems(listItems2).then((_) {
                                  setState(() {});
                                });
                                eCtrl.clear();
                              }
                            },
                          ),
                        ),
                        Container(
                          height: 70,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.7)),
                            onPressed: () {},
                            color: Colors.blueAccent,
                            child: IconButton(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              color: Colors.white,
                              hoverColor: Colors.white,
                              icon: Icon(
                                IconData(57669, fontFamily: 'MaterialIcons'),
                              ),
                              onPressed: () {
                                if (eCtrl.text.isEmpty) {
                                  _validate = true;
                                  setState(() {});
                                } else {
                                  _validate = false;
                                  // add a item
                                  listItems2.add(eCtrl.text);
                                  SharePrefs2.setListItems(listItems2).then((_) {
                                    setState(() {});
                                  });
                                  eCtrl.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listItems2.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index2) {
                        return Dismissible(
                          key: ObjectKey(listItems2[index2]),
                          child: Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            child: Container(
                              margin: const EdgeInsets.all(2.00),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(5.0))),
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(child: Text(listItems2[index2])),
                                    Container(
                                      width: 40,
                                      child: InkWell(
                                          child: Icon(
                                            Icons.remove_circle,
                                            color: Colors.redAccent,
                                          ),
                                          onTap: () {
                                            listItems2.removeAt(index2);
                                            SharePrefs2.setListItems(listItems2)
                                                .then((_) {
                                              setState(() {});
                                            });
                                          }),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
