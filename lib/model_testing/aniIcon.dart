import 'package:flutter/material.dart';

class aniIcon extends StatefulWidget {
  const aniIcon({Key? key}) : super(key: key);

  @override
  _aniIconState createState() => _aniIconState();
}

class _aniIconState extends State<aniIcon> with SingleTickerProviderStateMixin {
  bool isChanged = false;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    void trigger() {
      setState(() {
        isChanged = !isChanged;
        isChanged ? controller.forward() : controller.reverse();
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Icon'),
        ),
        body: Container(
          width: 250,
          child: IconButton(
            iconSize: 150,
            onPressed: trigger,
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_home,
              color: Colors.orange,
              progress: controller,
            ),
          ),
        ));
  }
}
