import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubuni_phone_app/api/http_client.dart';
import 'package:ubuni_phone_app/api/json_models/phone.dart';
import 'package:ubuni_phone_app/api/json_parsers/phone_parser.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ubuni_phone_app/routes.dart';

class PhoneGrid extends StatefulWidget {
  const PhoneGrid({Key? key}) : super(key: key);

  @override
  _PhoneGridState createState() => _PhoneGridState();
}

class _PhoneGridState extends State<PhoneGrid> {
  late final Future<List<Phone>> _phones;

  @override
  void initState() {
    super.initState();
    _phones = RequestREST(endpoint: "/phones").executeGet(const PhoneParser());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Phone>>(
      future: _phones,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data ?? [];
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 16),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              /* if (index.isEven) {
                return Container(
                    margin: EdgeInsets.only(top: 16),
                    child: PhoneGridItem(data[index]));
              } */
              return PhoneGridItem(data[index]);
            },
          );
        }

        if (snapshot.hasError) {
          return Container(
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: InkWell(
                child: Container(
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: Text(
                              "Seems we can't reach the Internet!!!",
                              style: GoogleFonts.lato(
                                  fontSize: 32, color: Colors.black87),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud_off_outlined,
                            color: Colors.black45,
                            size: 64,
                          )
                        ]),
                  ),
                ),
                onTap: () => setState(() {}),
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class PhoneGridItem extends StatelessWidget {
  final Phone _phone;
  const PhoneGridItem(this._phone);

  @override
  Widget build(BuildContext context) {
    final _price = (Random().nextDouble() * 1000).toStringAsFixed(2);

    return InkWell(
      child: Container(
        child: Column(
          children: [
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                child: CachedNetworkImage(
                    imageUrl: _phone.imageUrl,
                    placeholder: (context, url) => Container(
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: Colors.orange[400])),
                          height: 32,
                          width: 32,
                        ),
                    errorWidget: (context, url, error) => Container(
                          child: Center(
                              child: Icon(
                            Icons.aod_outlined,
                          )),
                          height: 32,
                          width: 32,
                        ),
                    fit: BoxFit.cover),
                width: 120,
                height: 200,
              ),
            )),
            Text("${_phone.brand} ${_phone.name}",
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600, fontSize: 20)),
            Text(
              "\$${_price}",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.deepOrange[400]),
            )
          ],
        ),
      ),
      onTap: () {
        print("Pushing: ${RouteGenerator.itemPage}");
        Navigator.pushNamed(context, RouteGenerator.itemPage,
            arguments: _phone);
      },
    );
  }
}
