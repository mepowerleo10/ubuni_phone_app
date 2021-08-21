import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuni_phone_app/routes.dart';

void main() => runApp(MiFoniApp());

class MiFoniApp extends StatelessWidget {
  const MiFoniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "MiFoni",
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

/* @override
Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
      Provider<DataCache>(create: (_) => DataCache()),
      ChangeNotifierProvider<Something>(
        create: (_) => Something()
      ),
    ],
    child: MaterialApp(...)
  );
} */

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            child: const Text(
              "+1",
              style: const TextStyle(color: Colors.green, fontSize: 25),
            ),
            onPressed: () => counter.increment(),
          ),
          Text("${counter.currentCount}",
              style: const TextStyle(color: Colors.black, fontSize: 30)),
          TextButton(
            child: const Text(
              "-1",
              style: const TextStyle(color: Colors.red, fontSize: 25),
            ),
            onPressed: () => counter.decrement(),
          )
        ],
      ),
    );
  }
}

class CounterModel with ChangeNotifier {
  int _counter = 0;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  int get currentCount => _counter;
}
