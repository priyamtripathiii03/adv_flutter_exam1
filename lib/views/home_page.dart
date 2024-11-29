import 'package:adv_flutter_exam1/provider/country_flag_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CountryProvider>(context, listen: false).fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    final countries = Provider.of<CountryProvider>(context).countries;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
        title: const Text(
          'All Countries',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/saved');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Container(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    countries[index].flag,
                    fit: BoxFit.cover,
                  )),
              title: Text(
                countries[index].name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(countries[index].capital,style: TextStyle(),),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/detail', arguments: countries[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
