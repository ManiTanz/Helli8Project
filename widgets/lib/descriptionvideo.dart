import 'dart:convert';
import 'package:first_app/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  // final img = await http.get(Uri.parse(""));
  // var imgJson = jsonDecode(img.body);
  // final title = await http.get(Uri.parse(""));
  // var titleJson = jsonDecode(title.body);
  List videos = [];
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    final response =
        await http.get(Uri.parse("http://154.91.170.55:8900/api/videos/"));
    print(response.statusCode);
    var videoJson = jsonDecode(response.body);
    for (var i in videoJson) {
      setState(() {
        var videoItem = Video(
          i['title'],
          i['video'],
          i['date_uploaded']
        );
        videos.add(videoItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Videos"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            children: [
              ...(videos).asMap().entries.map(
                (video) {
                  var videoValue = video.value;
                  var videoIndex = video.key;
                  return showVideo(context, videoValue);
                },
              ),
            ],
          ),
        ),
      );
}

Widget showVideo(BuildContext context, Video video) {
  return Card(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    child: InkWell(
      
       onTap: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChewieDemo()));
         },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
            const SizedBox(height: 30),
            Text(
              video.title,
              style: const TextStyle(fontFamily: "Vazirmatn"),
            ),
            Text(
              ":لینک ویدئو",
              style: TextStyle(
                  fontFamily: "Vazirmatn",
                  color: Colors.red[700],
                  fontSize: 40.0),
            ),
            Text(
              video.linkVideo,
            ),
            Text(
              ":تاریخ آپلود",
              style: TextStyle(
                  fontFamily: "Vazirmatn",
                  color: Colors.red[700],
                  fontSize: 40.0),
            ),
            Text(
              video.dateUpload
            )
          ]),
        ),
    ),
  );
}

class Video {
  final String title;
  //final String _img;
  final String linkVideo;
  final String dateUpload;

  Video(
    this.title,
    //this._img,
    this.linkVideo,
    this.dateUpload,
  );
  String get titleGet => title;
  //String get img => _img;
  String get linkVideoGet => linkVideo;
  String get dateUploadGet => dateUpload;
}
