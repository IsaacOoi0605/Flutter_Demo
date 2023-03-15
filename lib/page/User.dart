import 'package:flutter/material.dart';
import 'package:layout/page/drawer.dart';
import 'package:layout/model/post.dart';
import 'package:layout/model_testing/import_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

final list = [
  "Slider",
  "Sliver",
  "Animated Icon",
  "Carousel",
  "aboutDialog",
  "checkBox"
];

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(body: MyStatefulWidget());
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final Map = list.asMap();
  List<Widget> _screenList = <Widget>[
    slider(),
    sliver(),
    aniIcon(),
    CarouselDemo(),
    aboutDialog(),
    checkBox()
  ];
  List<Post>? posts;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("User"),
          ),
          drawer: MyDrawer(),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Material(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            child: Ink(
                              height: 40,
                              width: 40,
                              color: Colors.grey[150],
                              child: Icon(Icons.grid_on, size: 20),
                            ),
                            onTap: () {
                              print("You tapped square");
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            child: Ink(
                              height: 40,
                              width: 40,
                              color: Colors.grey[150],
                              child: Icon(Icons.list, size: 30),
                            ),
                            onTap: () {
                              print("You tapped list");
                            },
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      runSpacing: 12,
                      children: [
                        for (var i in Map.keys)
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue,
                              child: InkWell(
                                child: Ink(
                                  height: 100,
                                  width: 100,
                                  color: Colors.grey[150],
                                  child:
                                      Center(child: Text(list[i].toString())),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => _screenList[i]),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text("Welcome"),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }
}
