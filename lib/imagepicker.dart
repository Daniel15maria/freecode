import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagepicker extends StatefulWidget {
  const imagepicker({super.key});

  @override
  State<imagepicker> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<imagepicker> {
  ImagePicker _picker = ImagePicker();
  XFile? file;
  List<XFile> files = []; // Initialize the list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ImagePicker',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Center(
                child: file == null
                    ? Text(
                        "Image not picked",
                        style: TextStyle(fontSize: 50),
                      )
                    : Image.file(
                        File(file!.path),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final XFile? photo =
                    await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  file = photo;
                });
              },
              child: Text("Pick Image"),
            ),
            ElevatedButton(
              onPressed: () async {
                final List<XFile>? photos = await _picker.pickMultiImage();
                if (photos != null) {
                  setState(() {
                    files = photos;
                  });
                  for (int i = 0; i < files.length; i++) {
                    print(files[i].path);
                  }
                }
              },
              child: Text("Pick Multiple Images"),
            ),
          ],
        ),
      ),
    );
  }
}
