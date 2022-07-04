import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key, required this.title}) : super(key: key);
  final String title;
  void sag(){
    
  }
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
            picPicker("mmd", sag)
          ]
        )
        )
      );
  }
  static Widget picPicker(String fileName, Function onFilePicked){
    Future<PickedFile>? _imageFile;
    ImagePicker _picker = ImagePicker();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: IconButton(
                  icon: const Icon(
                  Icons.upload,
                   size: 35,
                 ),
                onPressed: (){
                  _imageFile = _picker.getImage(source: ImageSource.gallery) as Future<PickedFile>?;
                  _imageFile?.then((file) =>
                  {
                    onFilePicked(file)
                  });
                },
                 ),
            ),
          ],
        ),
      ],
    );
  }
}