import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text('Phones List'),
        ),
        body: FutureBuilder<List<Phone>>(
          future: phones,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data ?? [];
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return PhoneListItem(data[index]);
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
        ));
  }
}

class PhoneListItem extends StatelessWidget {
  final Phone _phone;

  const PhoneListItem(this._phone);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: TableRowInkWell(
      child: ListTile(
        leading: Icon(
          Icons.phone_android_outlined,
          size: 64,
        ),
        title: Text(_phone.name),
        subtitle: Text(_phone.brand),
      ),
      onTap: () => RouteGenerator.generateRoute(
          RouteSettings(arguments: _phone, name: RouteGenerator.itemPage)),
    ));
  }
}
