import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:provider/provider.dart';

import '../../provider/change_provider.dart';
import '../../provider/popupmenu_provider.dart';
import '../../utils/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;

  String selectedRadio = "https://www.google.com/";

  @override
  void initState() {
    Provider.of<ChangeProvider>(context, listen: false).onChangeLoad(true);
    pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        if (Platform.isAndroid) {
          inAppWebViewController?.reload();
        } else {
          var webUri = await inAppWebViewController?.getUrl();
          inAppWebViewController?.loadUrl(urlRequest: URLRequest(url: webUri));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Browser"),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 1) {
                Navigator.pushNamed(context, 'bookmark');
              } else if (value == 2) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return AlertDialog(
                          title: const Text('Search Engine'),
                          content:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            ...Data.dataBrows
                                .map((data) => RadioListTile<String>(
                                      title: Text("${data['title']}"),
                                      value: "${data['browsLink']}",
                                      groupValue: selectedRadio,
                                      onChanged: (val) {
                                        handleRadioValueChange(val!, context);
                                      },
                                    ))
                          ]),
                        );
                      },
                    );
                  },
                );
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.bookmark),
                        SizedBox(
                          width: 10,
                        ),
                        Text("All Bookmarks")
                      ],
                    )),
                PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.screen_search_desktop_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Search Engine")
                      ],
                    )),
              ];
            },
          )
        ],
      ),
      body: Consumer<PopupMenuProvider>(
        builder: (BuildContext context, PopupMenuProvider popupMenuProvider,
            Widget? child) {
          return Column(
            children: [
              Consumer<ChangeProvider>(
                builder: (BuildContext context, ChangeProvider value,
                    Widget? child) {
                  if (value.webProgress == 1) {
                    return SizedBox();
                  } else {
                    return LinearProgressIndicator(
                      minHeight: 10,
                      value: value.webProgress,
                      color: Colors.yellow,
                    );
                  }
                },
              ),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri("https://www.google.com/"),
                  ),
                  onWebViewCreated: (controller) {
                    inAppWebViewController = controller;
                  },
                  pullToRefreshController: pullToRefreshController,
                  onLoadStart: (controller, url) {
                    Provider.of<ChangeProvider>(context, listen: false)
                        .onChangeLoad(true);
                  },
                  onProgressChanged: (controller, progress) {
                    Provider.of<ChangeProvider>(context, listen: false)
                        .onWebProgress(progress / 100);
                    print("progress===> $progress");
                  },
                  onLoadStop: (controller, url) {
                    Provider.of<ChangeProvider>(context, listen: false)
                        .onChangeLoad(false);
                  },
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Colors.orange.withOpacity(0.2)),
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search or type web address",
                      label: Text("Search"),
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  onChanged: (value) {
                    String search = selectedRadio + "search?q=" + value;
                    inAppWebViewController?.loadUrl(
                        urlRequest: URLRequest(url: WebUri(search)));
                  },
                  onFieldSubmitted: (value) {
                    String search = selectedRadio + "search?q=" + value;
                    inAppWebViewController?.loadUrl(
                        urlRequest: URLRequest(url: WebUri(search)));
                  },
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(color: Colors.lightBlue.withOpacity(0.2)),
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        inAppWebViewController?.getOriginalUrl();
                      },
                      icon: Icon(Icons.home),
                      iconSize: 32,
                    ),
                    IconButton(
                      onPressed: () async {
                        WebUri? txt = await inAppWebViewController!.getUrl();
                        Data.bookURL.add(txt.toString());
                        Data.covertUniqueData();
                        print(Data.bookURL.length.toString());
                      },
                      icon: Icon(Icons.bookmark_add_outlined),
                      iconSize: 32,
                    ),
                    IconButton(
                      onPressed: () {
                        inAppWebViewController?.goBack();
                      },
                      icon: Icon(Icons.chevron_left),
                      iconSize: 37,
                    ),
                    IconButton(
                      onPressed: () {
                        inAppWebViewController?.reload();
                      },
                      icon: Icon(Icons.refresh),
                      iconSize: 32,
                    ),
                    IconButton(
                      onPressed: () {
                        inAppWebViewController?.goForward();
                      },
                      icon: Icon(Icons.chevron_right),
                      iconSize: 37,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void handleRadioValueChange(String value, BuildContext context) {
    selectedRadio = value;
    inAppWebViewController?.loadUrl(urlRequest: URLRequest(url: WebUri(value)));
    Navigator.of(context).pop();
  }
}
