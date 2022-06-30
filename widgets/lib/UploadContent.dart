import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'descriptionpage.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/upload-file.png", width: 100, height: 100,),
          ]
        )
        )
      );
  }
  static Widget picPicker(String fileName, Function onFilePicked){
    Future<PickedFile>? _imageFile;
    ImagePicker _picker = new ImagePicker();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35,
              width: 35,
              child: new IconButton(
                onPressed: (){
                  _imageFile = _picker.getImage(source: ImageSource.gallery) as Future<PickedFile>?;
                  _imageFile?.then((file) =>
                  {
                    onFilePicked(file)
                  });
                },
                 icon: Icon(
                  Icons.image,
                   size: 35,
                 )
                 ),
            ),
            SizedBox(
              height: 35,
              width: 35,
              child: new IconButton(onPressed: (){
                _imageFile = _picker.getImage(source: ImageSource.camera) as Future<PickedFile>?;
                _imageFile?.then((file) => 
                {
                  onFilePicked(file)
                });
              }, 
              icon: Icon(Icons.camera)),
            ),
            Image.file(File(fileName), width: 35, height: 35,)
          ],
        ),
      ],
    );
  }
}