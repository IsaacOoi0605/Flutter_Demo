import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/services.dart';

class slider extends StatefulWidget {
  const slider({Key? key}) : super(key: key);

  @override
  _sliderState createState() => _sliderState();
}

class _sliderState extends State<slider> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          print("ddd");
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Slider'),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  _currentValue.toString(),
                  style: TextStyle(fontSize: 30),
                ),
                Slider(
                  min: 0,
                  max: 100,
                  divisions: 10,
                  value: _currentValue,
                  label: _currentValue.toString(),
                  activeColor: Colors.black,
                  inactiveColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                      if (value == 0) {
                        Vibration.vibrate();
                      } else if (value <= 30) {
                        HapticFeedback.lightImpact();
                      } else if (value <= 60) {
                        HapticFeedback.mediumImpact();
                      } else {
                        HapticFeedback.heavyImpact();
                      }
                    });
                  },
                )
              ]),
        ) // Your Scaffold goes here.
        );
  }
}
