import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_bloc/src/screens/s.dart';
import 'package:login_bloc/src/screens/search.dart';
import '../compreal/gradText.dart';
import '../compreal/nav.dart';
import '../compreal/list.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _Firststate();
}

class _Firststate extends State<First> {
  final year = TextEditingController();
  final author = TextEditingController();
  final isbn = TextEditingController();
  final title = TextEditingController();
  final search = TextEditingController();
  bool pressAttention = true;
  bool pressAttention1 = true;
  bool pressAttention2 = true;
  bool pressAttention3 = true;
  bool pressAttention4 = true;
  bool pressAttention5 = true;
  bool pressAttention6 = true;
  String gen = "";
  final padding = EdgeInsets.symmetric(horizontal: 8);
  String user = "click on the image to login";
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.blueGrey,
        title: const Text('Newest Books'),
        actions: <Widget>[
          Visibility(
            visible: _isVisible,
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200.0,
                    height: 60.0,
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 0.0, bottom: 10.0, right: 0.0),
                    child: TextFormField(
                      controller: search,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter A book to Search',
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    (Icons.settings),
                    size: 30.0,
                    color: Colors.brown[900],
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => StatefulBuilder(
                                builder: (BuildContext context, setState) {
                              return AlertDialog(
                                  content: Container(
                                      height: 600,
                                      width: 400,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: <Widget>[
                                            Positioned(
                                              right: -40.0,
                                              top: -40.0,
                                              child: InkResponse(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: CircleAvatar(
                                                  child: Icon(Icons.close),
                                                  backgroundColor: Colors.red,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  margin: EdgeInsets.only(
                                                      left: 20, top: 10),
                                                  child: GradientText(
                                                    'Search by',
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                    gradient: LinearGradient(
                                                        colors: const [
                                                          Colors.blue,
                                                          Colors.blueGrey,
                                                        ]),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        margin: EdgeInsets.only(
                                                            left: 20),
                                                        child: GradientText(
                                                          'title :',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15),
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                                Colors.black,
                                                                Colors.blueGrey,
                                                              ]),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            top: 10,
                                                            bottom: 20),
                                                        child: TextField(
                                                            controller: title,
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText:
                                                                  'Enter title',
                                                            )),
                                                      ),
                                                      flex: 3,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        margin: EdgeInsets.only(
                                                            left: 20),
                                                        child: GradientText(
                                                          'Year :',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15),
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                                Colors.black,
                                                                Colors.blueGrey,
                                                              ]),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            top: 10,
                                                            bottom: 20),
                                                        child: TextField(
                                                            controller: year,
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText:
                                                                  'Enter Year',
                                                            )),
                                                      ),
                                                      flex: 3,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 25,
                                                      vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: GradientText(
                                                              'Genre :',
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          15),
                                                              gradient:
                                                                  LinearGradient(
                                                                      colors: const [
                                                                    Colors
                                                                        .black,
                                                                    Colors
                                                                        .blueGrey,
                                                                  ]),
                                                            ),
                                                            flex: 1,
                                                          ),
                                                          Expanded(
                                                            child: RaisedButton(
                                                              child: Text(
                                                                  'Action'),
                                                              textColor:
                                                                  Colors.white,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              color:
                                                                  pressAttention
                                                                      ? Colors
                                                                          .grey
                                                                      : Colors
                                                                          .blue,
                                                              onPressed: () =>
                                                                  setState(() =>
                                                                      pressAttention =
                                                                          !pressAttention),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: RaisedButton(
                                                                child: Text(
                                                                    'Adventure'),
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                color: pressAttention1
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .blue,
                                                                onPressed: () {
                                                                  setState(() =>
                                                                      pressAttention1 =
                                                                          !pressAttention1);
                                                                  this.setState(
                                                                      () {});
                                                                }),
                                                          ),
                                                          Expanded(
                                                            child: RaisedButton(
                                                                child: Text(
                                                                    'Mystery'),
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                color: pressAttention2
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .blue,
                                                                onPressed: () {
                                                                  setState(() =>
                                                                      pressAttention2 =
                                                                          !pressAttention2);
                                                                  this.setState(
                                                                      () {});
                                                                }),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 25,
                                                      vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: RaisedButton(
                                                                child: Text(
                                                                    'Crime'),
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                color: pressAttention3
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .blue,
                                                                onPressed: () {
                                                                  setState(() =>
                                                                      pressAttention3 =
                                                                          !pressAttention3);
                                                                  this.setState(
                                                                      () {});
                                                                }),
                                                          ),
                                                          Expanded(
                                                            child: RaisedButton(
                                                                child: Text(
                                                                    'Romance'),
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                color: pressAttention4
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .blue,
                                                                onPressed: () {
                                                                  setState(() =>
                                                                      pressAttention4 =
                                                                          !pressAttention4);
                                                                  this.setState(
                                                                      () {});
                                                                }),
                                                          ),
                                                          Expanded(
                                                            child: RaisedButton(
                                                                child: Text(
                                                                    'History '),
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                color: pressAttention5
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .blue,
                                                                onPressed: () {
                                                                  setState(() =>
                                                                      pressAttention5 =
                                                                          !pressAttention5);
                                                                  this.setState(
                                                                      () {});
                                                                }),
                                                          ),
                                                          Expanded(
                                                            child: RaisedButton(
                                                                child: Text(
                                                                    'Sports'),
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                ),
                                                                color: pressAttention6
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .blue,
                                                                onPressed: () {
                                                                  setState(() =>
                                                                      pressAttention6 =
                                                                          !pressAttention6);
                                                                  this.setState(
                                                                      () {});
                                                                }),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        margin: EdgeInsets.only(
                                                            left: 20),
                                                        child: GradientText(
                                                          'Author :',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15),
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                                Colors.black,
                                                                Colors.blueGrey,
                                                              ]),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            top: 10,
                                                            bottom: 20),
                                                        child: TextField(
                                                            controller: author,
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText:
                                                                  'Author Name',
                                                            )),
                                                      ),
                                                      flex: 3,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        margin: EdgeInsets.only(
                                                            left: 20),
                                                        child: GradientText(
                                                          'ISBN :',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15),
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                                Colors.black,
                                                                Colors.blueGrey,
                                                              ]),
                                                        ),
                                                      ),
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        margin: EdgeInsets.only(
                                                            left: 10,
                                                            top: 10,
                                                            bottom: 20),
                                                        child: TextField(
                                                            controller: isbn,
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText:
                                                                  'Book ISBN',
                                                            )),
                                                      ),
                                                      flex: 3,
                                                    ),
                                                  ],
                                                ),
                                                RaisedButton(
                                                  onPressed: () async {
                                                    if (!pressAttention) {
                                                      gen = "Action";
                                                    }
                                                    if (!pressAttention1) {
                                                      gen = "Adventure";
                                                    }
                                                    if (!pressAttention2) {
                                                      gen = "Mystery";
                                                    }
                                                    if (!pressAttention3) {
                                                      gen = "Crime";
                                                    }
                                                    if (!pressAttention4) {
                                                      gen = "Romance";
                                                    }
                                                    if (!pressAttention5) {
                                                      gen = "History";
                                                    }
                                                    if (!pressAttention6) {
                                                      gen = "Sports";
                                                    }
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Searchh(
                                                                gen,
                                                                title.text,
                                                                year.text,
                                                                author.text,
                                                                isbn.text),
                                                      ),
                                                    );
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              80.0)),
                                                  padding: EdgeInsets.all(0.0),
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xff374ABE),
                                                            Color(0xff64B6FF)
                                                          ],
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    30.0)),
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxWidth: 250.0,
                                                              minHeight: 50.0),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Submit",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )));
                            }));
                  },
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              (Icons.search),
              size: 30.0,
              color: Colors.brown[900],
            ),
            onPressed: () {
              if (!_isVisible) {
                setState(() {
                  _isVisible = true;
                });
              } else if (_isVisible) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search(search.text)),
                );
              }
            },
          ),
          Padding(padding: padding)
        ],
      ),
      body: ListV(),
    );
  }
}
