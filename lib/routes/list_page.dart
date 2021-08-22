import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubuni_phone_app/api/http_client.dart';
import 'package:ubuni_phone_app/api/json_models/phone.dart';
import 'package:ubuni_phone_app/api/json_parsers/phone_parser.dart';
import 'package:ubuni_phone_app/routes.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late final Future<List<Phone>> phones;

  @override
  void initState() {
    super.initState();
    phones = RequestREST(endpoint: "/phones")
        .executeGet<List<Phone>>(const PhoneParser());
  }

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
                  icon: Icon(Icons.chevron_left_outlined),
                  onPressed: () => Navigator.of(context).pop(),
                )),
                Text(
                  'Favorites',
                  style: GoogleFonts.lato(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder<List<Phone>>(
            future: phones,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data ?? [];
                return ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return PhoneListItem(data[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: Colors.deepOrange[100],
                      endIndent: 24,
                    );
                  },
                );
              }

              if (snapshot.hasError) {
                return SingleChildScrollView(
                  child: Text('${snapshot.error}'),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ))
        ],
      ),
    ));
  }
}

class PhoneListItem extends StatelessWidget {
  final Phone _phone;

  const PhoneListItem(this._phone);

  @override
  Widget build(BuildContext context) {
    final _price = (Random().nextDouble() * 1000).toStringAsFixed(2);

    return InkWell(
        child: ListTile(
          leading: Expanded(
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
            ),
          ),
          title: Text(
            "${_phone.brand} ${_phone.name}",
            style: GoogleFonts.lato(fontSize: 24),
          ),
          subtitle: Text(
            "\$${_price}",
            style:
                GoogleFonts.lato(fontSize: 18, color: Colors.deepOrange[400]),
          ),
        ),
        onTap: () => Navigator.pushNamed(context, RouteGenerator.itemPage,
            arguments: _phone));
  }
}
