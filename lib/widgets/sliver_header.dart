import 'package:flutter/material.dart';

class SliverHeader extends StatelessWidget {
  const SliverHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      floating: true,
      title: Container(
        child: Text(
          'MiFoNi',
          style: TextStyle(
              fontFamily: 'RampartOne', fontSize: 42.0, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.deepOrange[200],
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/sliver_bg.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
