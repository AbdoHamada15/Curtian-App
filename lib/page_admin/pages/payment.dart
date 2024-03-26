import 'package:flutter/material.dart';
import 'package:curtian_app/page_admin/menu.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      leading: const MenuWidget(),
      title: const Text('Payment', style: TextStyle(color: Colors.black)),
    ));
  }
}
