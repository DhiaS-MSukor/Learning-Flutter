import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
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
                    : Image.file(File(_imageFile.path)),
              ),
              RaisedButton(onPressed: null, child: Text('Submit')),
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
    final pickedFile = await _picker.getImage(source: source);

    setState(() {
      _imageFile = pickedFile;
    });
  }
}
