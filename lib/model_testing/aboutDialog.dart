import 'package:flutter/material.dart';

class aboutDialog extends StatefulWidget {
  const aboutDialog({Key? key}) : super(key: key);

  @override
  _aboutDialogState createState() => _aboutDialogState();
}

class _aboutDialogState extends State<aboutDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Show About Dialog"),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  showAboutDialog(
                      context: context,
                      children: [Image.asset("images/flutter2.png")]);
                },
                child: Text("show dialog"))));
  }
}
