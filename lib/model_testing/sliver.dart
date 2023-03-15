import 'package:flutter/material.dart';

class sliver extends StatefulWidget {
  const sliver({Key? key}) : super(key: key);

  @override
  _sliverState createState() => _sliverState();
}

class _sliverState extends State<sliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          //appbar
          SliverAppBar(
            leading: Icon(Icons.menu),
            backgroundColor: Colors.deepPurple,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.red,
              ),
              title: Text('S L I V E R A P P B A R'),
            ),
            expandedHeight: 250,
          ),
          //content
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.all(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 400,
                color: Colors.deepPurple[300],
              ),
            ),
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.all(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 400,
                color: Colors.deepPurple[300],
              ),
            ),
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.all(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 400,
                color: Colors.deepPurple[300],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
