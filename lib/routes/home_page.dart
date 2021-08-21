import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:ubuni_phone_app/routes.dart';
import 'package:ubuni_phone_app/widgets/carousel.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: InkWell(
              child: FloatingSearchBar(
                title: Text('Search Phones...'),
                iconColor: ThemeData.light().accentColor,
                transitionCurve: Curves.easeInOutCubic,
                transition: CircularFloatingSearchBarTransition(),
                physics: const BouncingScrollPhysics(),
                builder: (context, _) => buildBody(),
              ),
            )),
            Expanded(flex: 6, child: Carousel()),
            SizedBox(
              child: InkWell(
                child: OutlinedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(RouteGenerator.listPage),
                  child: Row(
                    children: [
                      Text("See Our Catalogue"),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
              ),
              width: 200,
            )
          ],
        ),
      ),
    );
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
