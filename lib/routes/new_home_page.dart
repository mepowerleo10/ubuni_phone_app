import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:ubuni_phone_app/widgets/carousel.dart';
import 'package:ubuni_phone_app/widgets/product_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(6),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )),
                Text(
                  'MiFoNi',
                  style: TextStyle(
                      fontFamily: 'RampartOne',
                      fontSize: 36.0,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  icon: Icon(Icons.notifications_on_outlined),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Card(
            child: Container(
              height: 200,
              child: Carousel(),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          /* Container(
            child: Expanded(
                child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Chip(
                    label: Text('iPhone'),
                  ),
                  Chip(
                    label: Text('Samsung'),
                  ),
                  Chip(
                    label: Text('TECNO'),
                  )
                ],
              ),
            )),
          ), */
          Container(color: Colors.yellowAccent),
          Expanded(child: PhoneGrid()),
        ],
      ),
    ));
  }

  Widget buildBody() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: Column(
          children: List.generate(100, (index) => index.toString())
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
