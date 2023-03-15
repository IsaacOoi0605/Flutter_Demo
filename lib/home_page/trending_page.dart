import 'package:flutter/material.dart';

int num = 30;

class trending extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<trending>
    with AutomaticKeepAliveClientMixin {
  void Haha() {
    print("hha");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Haha();
    return Scaffold(
      body: ListView.builder(
          itemCount: num,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.list),
              trailing: const Text(
                "GFG",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              title: Text(
                "List item $index",
              ),
              subtitle: Text("Subtitle"),
              onTap: () {
                print("haha $index");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          print("ddd");
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Second Route'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                // Navigate back to first route when tapped.
              },
              child: const Text('Go back!'),
            ),
          ),
        ) // Your Scaffold goes here.
        );
  }
}
