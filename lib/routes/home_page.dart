import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: InkWell(
              child: FloatingSearchBar(
                transitionCurve: Curves.easeInOutCubic,
                transition: CircularFloatingSearchBarTransition(),
                physics: const BouncingScrollPhysics(),
                builder: (context, _) => buildBody(),
              ),
            ))
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
