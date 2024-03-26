import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:curtian_app/page_admin/menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:paris_app_gallery/screens/admin/screens/admin/admin/screens/menu.dart';
//import 'package:paris_app_gallery/screens/admin/wid/toast.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final user = FirebaseAuth.instance.currentUser!;
  final TextEditingController _controllerTitle = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('Story');
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MenuWidget(),
        backgroundColor: Colors.blueAccent,
        title:
            const Text('Upload Image', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerTitle,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
              IconButton(
                  onPressed: () async {
                    /*
                * Step 1. Pick/Capture an image   (image_picker)
                * Step 2. Upload the image to Firebase storage
                * Step 3. Get the URL of the uploaded image
                * Step 4. Store the image URL inside the corresponding
                *         document of the database.
                * Step 5. Display the image on the list
                *
                * */

                    /*Step 1:Pick image*/
                    //Install image_picker
                    //Import the corresponding library

                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    print('${file?.path}');

                    if (file == null) return;
                    //Import dart:core

                    /*Step 2: Upload to Firebase storage*/
                    //Install firebase_storage
                    //Import the library

                    //Get a reference to storage root
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages = referenceRoot.child('Story');

                    //Create a reference for the image to be stored
                    Reference referenceImageToUpload =
                        referenceDirImages.child('name');

                    //Handle errors/success
                    try {
                      //Store the file
                      await referenceImageToUpload.putFile(File(file.path));
                      //Success: get the download URL
                      imageUrl = await referenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      //Some error occurred
                    }
                  },
                  icon: const Icon(Icons.camera_alt)),
              ElevatedButton(
                  onPressed: () async {
                    if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please upload an image')));

                      return;
                    }

                    if (key.currentState!.validate()) {
                      String itemTitle = _controllerTitle.text;

                      //Create a Map of data
                      Map<String, String> dataToSend = {
                        'title': itemTitle,
                        'image': imageUrl,
                      };

                      //Add a new item
                      _reference.add(dataToSend);
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
/*
  Future openDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                padding: const EdgeInsets.all(20),
                height: 400,
                width: 327,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/img/background/one.png"),
                    Text(
                      "Upload sucsess",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      "Your recipe has benn uploaded",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "You can see it in your Profile",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    /*
                    CustomButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        text: "Back to Home")
                        */
                  ],
                ),
              ),
            ));
  }
} */
