import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class p1 extends StatefulWidget {
  const p1({Key? key}) : super(key: key);

  @override
  _P1State createState() => _P1State();
}

class _P1State extends State<p1> {
  List countries = [];
  List states = [];
  List cities = [];
  String? selectedCountry, selectedState, selectedCity;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  fetchCountries() async {
    var res = await http.get(
      Uri.parse('https://countriesnow.space/api/v0.1/countries/states'),
    );
    var data = json.decode(res.body);
    setState(() {
      countries = data['data'];
    });
  }

  fetchStates(String country) async {
    var c = countries.firstWhere(
      (e) => e['name'] == country,
      orElse: () => null,
    );
    setState(() {
      states = c != null ? c['states'] : [];
      selectedState = null;
      cities = [];
      selectedCity = null;
    });
  }

  fetchCities(String country, String state) async {
    var res = await http.post(
      Uri.parse('https://countriesnow.space/api/v0.1/countries/state/cities'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'country': country, 'state': state}),
    );
    var data = json.decode(res.body);
    // Remove duplicates from city list
    List cityList = (data['data'] ?? []);
    cityList = cityList.toSet().toList();
    setState(() {
      cities = cityList;
      // If the previously selected city is not in the new list, reset it
      if (!cities.contains(selectedCity)) {
        selectedCity = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country State City')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select Country'),
              value: selectedCountry,
              items:
                  countries
                      .map<DropdownMenuItem<String>>(
                        (c) => DropdownMenuItem(
                          value: c['name'],
                          child: Text(c['name']),
                        ),
                      )
                      .toList(),
              onChanged: (v) {
                setState(() {
                  selectedCountry = v;
                  selectedState = null;
                  selectedCity = null;
                  states = [];
                  cities = [];
                });
                if (v != null) fetchStates(v);
              },
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select State'),
              value: selectedState,
              items:
                  states
                      .map<DropdownMenuItem<String>>(
                        (s) => DropdownMenuItem(
                          value: s['name'],
                          child: Text(s['name']),
                        ),
                      )
                      .toList(),
              onChanged: (v) {
                setState(() {
                  selectedState = v;
                  selectedCity = null;
                  cities = [];
                });
                if (v != null && selectedCountry != null)
                  fetchCities(selectedCountry!, v);
              },
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select City'),
              value: selectedCity,
              items:
                  cities
                      .map<DropdownMenuItem<String>>(
                        (c) => DropdownMenuItem(value: c, child: Text(c)),
                      )
                      .toList(),
              onChanged: (v) {
                setState(() {
                  selectedCity = v;
                });
              },
            ),
            SizedBox(height: 32),
            if (selectedCountry != null &&
                selectedState != null &&
                selectedCity != null)
              Center(
                child: Text(
                  'Country: $selectedCountry\nState: $selectedState\nCity: $selectedCity',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
