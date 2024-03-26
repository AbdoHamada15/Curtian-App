import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import '../../forms/toast.dart';
import '../../menu.dart';

import 'package:animate_do/animate_do.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../page_gallery/constants/constants.dart';

class Upload4 extends StatefulWidget {
  const Upload4({super.key});

  @override
  State<Upload4> createState() => _Upload4State();
}

class _Upload4State extends State<Upload4> with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  final String _image =
      'https://ouch-cdn2.icons8.com/84zU-uvFboh65geJMR5XIHCaNkx-BZ2TahEpE9TpVJM/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvODU5/L2E1MDk1MmUyLTg1/ZTMtNGU3OC1hYzlh/LWU2NDVmMWRiMjY0/OS5wbmc.png';
  late AnimationController loadingController;

  File? _file;
  PlatformFile? _platformFile;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  final picker = ImagePicker();
  bool isLoading = false;

  String imageName = '';
  String imageUrl = '';
  Future _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
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
        .child('products/images/${Path.basename(_file!.path)}');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6.0,
        leading: const MenuWidget(),
        title: const Text('Upload Image'),
        backgroundColor: Colors.blue[600],
      ),
      body: SingleChildScrollView(
        child: FadeIn(
          duration: const Duration(milliseconds: 1000),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Image.network(
                _image,
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Upload your file',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'File should be jpg, png',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  controller: _controller,
                  onChanged: (v) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
              ),
              GestureDetector(
                onTap: selectFile,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      strokeCap: StrokeCap.round,
                      color: Colors.blue.shade400,
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.folder_open,
                              color: Colors.blue,
                              size: 40,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Select your file',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade400),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              _platformFile != null
                  ? Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected File',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kwhiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: const Offset(0, 1),
                                      blurRadius: 3,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        _file!,
                                        width: 70,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _platformFile!.name,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${(_platformFile!.size / 1024).ceil()} KB',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey.shade500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            height: 5,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.blue.shade50,
                                            ),
                                            child: LinearProgressIndicator(
                                              value: loadingController.value,
                                            )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  _uploadImage(_file!, imageName);
                                },
                                child: const Text('UPLOAD IMAGE')),
                          ),
                        ],
                      ))
                  : Container(),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
