import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Videos"),
        ),
        body: const EasyWebView(
          src: 'assets/web/index.html',
        ),
      );
}
