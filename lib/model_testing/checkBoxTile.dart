import 'package:flutter/material.dart';

class checkBox extends StatefulWidget {
  const checkBox({Key? key}) : super(key: key);

  @override
  _checkBoxState createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {
  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Icon'),
        ),
        body: ListView(
          children: [
            for (int i = 0; i < 50; i++)
              CheckboxListTile(
                title: Text("Something to check"),
                secondary: Icon(Icons.beach_access),
                controlAffinity: ListTileControlAffinity.platform,
                value: _checked,
                onChanged: (bool? value) {
                  setState(() {
                    _checked = value;
                  });
                },
                activeColor: Colors.green,
                checkColor: Colors.black,
              ),
          ],
        ));
  }
}
