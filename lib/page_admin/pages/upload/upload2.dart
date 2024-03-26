import 'dart:io';

import 'package:curtian_app/page_admin/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class Upload2 extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final String title;
  Upload2({super.key, required this.title});

  @override
  State<Upload2> createState() => _Upload2State();
}

class _Upload2State extends State<Upload2> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    setState(() {
      isLoading = true;
    });
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {}

    setState(() {
      isLoading = true;
    });

    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('error occured');
    }
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MenuWidget(),
        backgroundColor: Colors.blueAccent,
        title:
            const Text('Upload Image', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.white,
        height: 550,
        width: 550,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.white),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xffFDCF09),
                  child: _photo != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _photo!,
                            width: 500,
                            height: 500,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 2),
                                spreadRadius: 2,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          width: 510,
                          height: 510,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // background
                foregroundColor: Colors.grey,
                elevation: 5.0, // foreground
              ),
              onPressed: () {
                uploadFile();
              },
              child: const Text("Upload Image",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: imgFromGallery,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

      /*
      body: Center(
        child: Column(
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text('Selected Image'),
                      _image != null
                          ? Image.file(
                              _image,
                              // height: 150,
                              height: 150,
                              width: 150,
                            )
                          : const SizedBox(
                              height: 150,
                              child: Center(
                                child: Text(
                                  "No Image is Selected",
                                ),
                              ),
                            ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Text('Uploaded Image'),
                      _uploadedFileURL != null
                          ? Image.network(
                              _uploadedFileURL,
                              height: 150,
                              width: 150,
                            )
                          : const SizedBox(
                              height: 150,
                              child: Center(
                                child: Text(
                                  "No Image is Selected",
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
            _image != null
                ? isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: uploadFile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // background
                          foregroundColor: Colors.white, // foreground
                        ),
                        child: const Text('Upload Image'),
                      )
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: chooseFile,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
      
    );
  }
} */
