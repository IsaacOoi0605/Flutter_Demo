import 'package:flutter/material.dart';

int nee = 20;

class recommend extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<recommend>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: nee,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: new Tab(
                  icon: new Image.asset("images/lake.jpg",
                      width: 80, height: 50, fit: BoxFit.fill)),
              trailing: const Text(
                "GFG",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              title: Text(
                "List item $index",
              ),
              subtitle: Text("Subtitle"),
              onTap: () {
                print("haha");
              },
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
