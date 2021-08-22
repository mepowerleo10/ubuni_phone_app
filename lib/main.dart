import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(
          accentColor: Colors.deepOrangeAccent,
          primaryColor: Colors.deepOrange[400],
          fontFamily: GoogleFonts.lato().fontFamily),
    );
  }
}
