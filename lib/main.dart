import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App',
      home: ChangeNotifierProvider(
        create: (context) => CounterModel(),
        child: DemoPage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

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
