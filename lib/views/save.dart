import 'package:adv_flutter_exam1/provider/country_flag_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final savedCountries = Provider.of<CountryProvider>(context).savedCountries;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 10,
        shadowColor: Colors.black,

        title: Text('Saved Countries',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: savedCountries.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(savedCountries[index].flag),
            title: Text(savedCountries[index].name),
            subtitle: Text(savedCountries[index].capital),
          );
        },
      ),
    );
  }
}