import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:layout/page/Home.dart';
import 'package:layout/page/User.dart';
import 'package:layout/page/Setting.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  int n = 10;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        children: <Widget>[Home(), User(), Setting()],
        index: _selectedIndex,
      ),
      bottomNavigationBar: FloatingNavbar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
          FloatingNavbarItem(icon: Icons.play_arrow, title: 'Video'),
        ],
      ),
    );
  }
}
