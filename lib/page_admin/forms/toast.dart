import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../page_gallery/constants/constants.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: kwhiteColor,
      fontSize: 16.0);
}
