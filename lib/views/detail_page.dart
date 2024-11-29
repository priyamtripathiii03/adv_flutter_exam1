import 'package:adv_flutter_exam1/model/model.dart';
import 'package:adv_flutter_exam1/provider/country_flag_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Country country =
        ModalRoute.of(context)!.settings.arguments as Country;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 10,
        shadowColor: Colors.black,
        title: const Text(
          " Countries Details",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Image.network(country.flag),
          ),
          Text(country.name,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text(
            'Capital: ${country.capital}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Region: ${country.region}',
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<CountryProvider>(context, listen: false)
                  .saveCountry(country);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${country.name} Saved your Country!')));
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
