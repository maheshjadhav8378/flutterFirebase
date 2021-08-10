import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  final Function pickedImage;
  final imageFile;

  PickImage(this.pickedImage, this.imageFile);

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  var pickedImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedImage = widget.imageFile;
  }

  void pickImage() async {
    final imagePicker = ImagePicker();
    final xFile = await imagePicker.pickImage(source: ImageSource.camera);
    final file = File(xFile!.path);
    setState(() {
      pickedImage = file;
    });
    widget.pickedImage(file);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: pickedImage != null ? FileImage(pickedImage) : null,
          radius: 40,
        ),
        TextButton.icon(
          onPressed: pickImage,
          icon: Icon(Icons.image),
          label: Text('Take Picture'),
        ),
      ],
    );
  }
}
