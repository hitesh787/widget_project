import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast_web.dart';

class CurrencyPicker extends StatefulWidget {
  const CurrencyPicker({Key? key}) : super(key: key);

  @override
  State<CurrencyPicker> createState() => _CurrencyPickerState();
}

class _CurrencyPickerState extends State<CurrencyPicker> {
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo for currency picker')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showCurrencyPicker(
              context: context,
              showFlag: true,
              showSearchField: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              favorite: ['INR','USD'],
              onSelect: (Currency currency) {},

            );
          },
          child: Text('Show currency picker'),
        ),
      ),
    );
  }
}
