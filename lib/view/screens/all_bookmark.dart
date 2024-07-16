import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/provider/delete_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/data.dart';

class AllBookmark extends StatefulWidget {
  const AllBookmark({super.key});

  @override
  State<AllBookmark> createState() => _AllBookmarkState();
}

class _AllBookmarkState extends State<AllBookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmark"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete'),
                    content: const Text(
                        'Are you sure you want to delete all Bookmarks?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Confirm'),
                        onPressed: () {
                          Provider.of<DeleteProvider>(context, listen: false)
                              .deleteAll();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.delete),
            color: Colors.black.withOpacity(0.5),
          )
        ],
      ),
      body: Data.bookMarkURL.length == 0
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.no_sim,
                    size: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No Bookmark",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                ],
              ),
            )
          : Consumer<DeleteProvider>(
              builder:
                  (BuildContext context, DeleteProvider value, Widget? child) {
                return ListView.builder(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  itemCount: Data.bookMarkURL.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        _launchURL(Data.bookMarkURL[index]);
                      },
                      child: Container(
                        height: 90,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.green.withOpacity(0.2),),
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 280,
                              child: Text(
                                "${Data.bookMarkURL[index].toString()}",
                                style: TextStyle(fontSize: 20),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  value.deleteBookMark(index);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey.shade700,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

_launchURL(String url) async {
  // Replace with your URL

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
