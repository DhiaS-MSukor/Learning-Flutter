import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  PickedFile _imageFile;
  ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Form'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Text'),
              ),
              SizedBox(height: 100),
              RaisedButton(
                onPressed: () {
                  _selectImageButton(context);
                },
                child: _imageFile == null
                    ? Icon(Icons.image)
                    : Image.file(
                        File(_imageFile.path),
                        width: 320,
                        height: 240,
                      ),
              ),
              RaisedButton(
                  onPressed: () {
                    // TODO: Submit function
                    // open db
                    // post to db
                    // pop navigator
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit')),
            ],
          ),
        ));
  }

  Future<void> _selectImageButton(context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Choose method'),
            content: Column(children: [
              RaisedButton(
                  onPressed: () {
                    _pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.camera_alt)),
              RaisedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.photo_library),
              )
            ]),
          );
        });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(
        source: source); //, maxWidth: 640, maxHeight: 480, imageQuality: 100);

    if (source == ImageSource.camera) {
      try {
        GallerySaver.saveImage(pickedFile.path, albumName: 'KLConnectIT');
      } catch (e) {}
    }

    setState(() {
      _imageFile = pickedFile;
    });
  }
}
