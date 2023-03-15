import 'package:flutter/material.dart';
import 'package:layout/page/drawer.dart';
import 'package:layout/home_page/import_page.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(body: MyStatefulWidget());
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Video', style: TextStyle(color: Colors.black)),
        // Use TabBar to show the three tabs
        bottom: TabBar(
          padding: const EdgeInsets.all(10.0),
          labelColor: Colors.white,
          indicator: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          controller: _tabController,
          unselectedLabelColor: Colors.black,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.video_label,
                  color:
                      _tabController.index == 0 ? Colors.white : Colors.black),
              text: 'Suggested',
            ),
            Tab(
              icon: Icon(Icons.trending_up,
                  color:
                      _tabController.index == 1 ? Colors.white : Colors.black),
              text: 'Trending',
            ),
            Tab(
                icon: Icon(Icons.tv,
                    color: _tabController.index == 2
                        ? Colors.white
                        : Colors.black),
                text: 'Live'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [recommend(), trending(), live()],
      ),
    );
  }
}
