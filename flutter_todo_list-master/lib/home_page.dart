import 'package:flutter/material.dart';
import 'package:flutter_sample_app/shared_prefs.dart';
import 'app_background.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

var homePageKey = GlobalKey<_HomePageState>();

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listItems = [];

  bool _validate = false;

  final TextEditingController eCtrl = TextEditingController();

  final PageController controller = PageController(
    initialPage: 1,
  );

  void _init() async {
    await SharePrefs.setInstance();
    listItems = SharePrefs.getListItems();
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
        title: Text("Urgent And Important"),
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
                                listItems.add(text);
                                SharePrefs.setListItems(listItems).then((_) {
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
                                  listItems.add(eCtrl.text);
                                  SharePrefs.setListItems(listItems).then((_) {
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
                      itemCount: listItems.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: ObjectKey(listItems[index]),
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
                                    Expanded(child: Text(listItems[index])),
                                    Container(
                                      width: 40,
                                      child: InkWell(
                                          child: Icon(
                                            Icons.remove_circle,
                                            color: Colors.redAccent,
                                          ),
                                          onTap: () {
                                            listItems.removeAt(index);
                                            SharePrefs.setListItems(listItems)
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
