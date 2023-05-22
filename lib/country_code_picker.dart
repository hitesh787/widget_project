import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class CountryCodePickerWidget extends StatefulWidget {
  const CountryCodePickerWidget({Key? key}) : super(key: key);

  @override
  State<CountryCodePickerWidget> createState() =>
      _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget> {
  String countryCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country code picker'),
      ),
      body: Column(
        children: [
          Text(countryCode.toString()),
          Center(
            child: TextButton(
                onPressed: () {
                  showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      countryListTheme: const CountryListThemeData(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10)),
                          inputDecoration: InputDecoration(
                            hintText: 'Start typing to search',
                            labelText: 'Search ',
                          )),
                      favorite: ['IN'],
                      onSelect: (Country value) {
                        print(value.countryCode.toString());
                        print(value.phoneCode.toString());
                        countryCode = value.phoneCode.toString();
                        setState(() {});
                      });
                },
                child: const Text('Tap')),
          ),

          // CSCPicker(
          //   onCityChanged: (city){},
          //   onCountryChanged: (country){},
          //   onStateChanged: (state){},
          //   disableCountry: true,
          // )
        ],
      ),
    );
  }
}
