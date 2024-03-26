import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import '../../forms/toast.dart';
import '../../menu.dart';

class Upload3 extends StatefulWidget {
  const Upload3({super.key});

  @override
  State<Upload3> createState() => _Upload3State();
}

class _Upload3State extends State<Upload3> {
  final user = FirebaseAuth.instance.currentUser!;
  final picker = ImagePicker();
  bool isLoading = false;
  File? imageFile;
  String imageName = '';
  String imageUrl = '';
  Future _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        imageName = pickedFile.name;
      });
    }
  }

  final TextEditingController _controller = TextEditingController();
  Future _uploadImage(File localFile, imageName) async {
    setState(() {
      isLoading = true;
    });
    /*
    String imgId = DataTime.now().microsecondsSinceEpoch.toString();
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('products/images/user$imgId');
        */
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('products/images/${Path.basename(imageFile!.path)}');
    await firebaseStorageRef.putFile(localFile).whenComplete(() async {
      String url = await firebaseStorageRef.getDownloadURL();
      setState(() {
        imageUrl = url;
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed('homeadmin');
      showToast(message: "Uploaded");

      try {
        setState(() {
          isLoading = true;
        });
        var docReference =
            FirebaseFirestore.instance.collection('products').doc();
        await docReference.set({
          'title': _controller.text,
          'image': imageUrl,
        });
        showToast(message: "Uploaded");
      } catch (e) {
        showToast(message: "Error");

        setState(() {
          isLoading = false;
        });
        print(e);
      }
      // ignore: use_build_context_synchronously
    });
  }

  Future upload() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        leading: const MenuWidget(),
        title: const Text('Upload Image'),
        backgroundColor: Colors.blue[600],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 350,
                              margin: const EdgeInsets.only(
                                  left: 30.0, right: 30.0, top: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: imageFile != null
                                    ? Image.file(imageFile!)
                                    : TextButton(
                                        onPressed: _pickImage,
                                        child: const Icon(
                                          Icons.add_a_photo,
                                          size: 50,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: _controller,
                      onChanged: (v) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(hintText: 'Title'),
                    ),
                    //_showImage(),
                    const SizedBox(height: 20.0),
                    imageFile == null
                        ? ElevatedButton(
                            onPressed: () {
                              _pickImage();
                            },
                            child: const Text('PICK IMAGE'))
                        : ElevatedButton(
                            onPressed: () {
                              _uploadImage(imageFile!, imageName);
                            },
                            child: const Text('UPLOAD IMAGE')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
