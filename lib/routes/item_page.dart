import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubuni_phone_app/api/json_models/phone.dart';
import 'package:ubuni_phone_app/widgets/dialog.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _phone = ModalRoute.of(context)!.settings.arguments as Phone;
    final _price = (Random().nextDouble() * 1000).toStringAsFixed(2);
    final _rating = Random().nextDouble() * 5;

    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(0),
      child: Stack(
        children: [
          Column(
            children: [
              IntrinsicWidth(
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
                    height: 450,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_phone.brand} ${_phone.name}",
                          style: GoogleFonts.lato(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Used 6 Months",
                          style: GoogleFonts.lato(
                              fontSize: 22, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Text("\$${_price}",
                        style: GoogleFonts.lato(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange[400]))
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                RatingBar.builder(
                  initialRating: _rating,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                OutlinedButton(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      "Buy",
                      style: GoogleFonts.lato(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange[400]),
                    ),
                  ),
                  onPressed: () {},
                )
              ]),
            ],
          ),
        ],
      ),
    ));
  }
}
