import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubuni_phone_app/widgets/sliver_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverHeader(),
            SliverFixedExtentList(
              itemExtent: 150.0,
              delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.red),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.orange),
                  Container(color: Colors.yellow),
                  Container(color: Colors.pink),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: InkWell(
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.deepOrange[200],
                  child: Text(
                    "ME",
                    style: GoogleFonts.lato(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              margin: const EdgeInsets.only(top: 8, left: 8),
            ),
            InkWell(
                child: IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {},
            ))
          ],
        )
      ],
    ));
  }
}
