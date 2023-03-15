import 'package:flutter/material.dart';
import 'package:layout/model/post.dart';
import 'package:layout/services/remote_services.dart';

int n = 30;

class live extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<live> with AutomaticKeepAliveClientMixin {
  List<Post>? posts;
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Visibility(
      visible: isLoaded,
      child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[300]),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(posts![index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Text(posts![index].body ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20))
                          ]),
                    )
                  ],
                ));
          }),
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
