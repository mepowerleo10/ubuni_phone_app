import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/api/json_models/phone.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _phone = ModalRoute.of(context)!.settings.arguments as Phone;

    return Scaffold(
      body: Center(
        child: Text(_phone.name),
      ),
    );
  }
}
