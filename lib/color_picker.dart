import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerApp extends StatefulWidget {
  const ColorPickerApp({super.key});

  @override
  State<ColorPickerApp> createState() => _ColorPickerAppState();
}

class _ColorPickerAppState extends State<ColorPickerApp> {

  Color selectedDcolor = Colors.tealAccent;
  // final colorHistory = [
  //   Colors.red,
  //   Colors.amber,
  //   Colors.teal,
  //   Colors.blueGrey,
  //   Colors.indigo
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Color Picker App ',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
          backgroundColor: selectedDcolor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Data',style: TextStyle(color: selectedDcolor,fontSize: 30),),
              const SizedBox(height: 20,),
              Container(
                height: 300,
                width: 300,
                color: selectedDcolor,
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: const Text(
                            'Pick Color',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),

                          children: [

                            ColorPicker(
                                pickerColor: selectedDcolor,
                                // colorHistory: colorHistory,
                                paletteType: PaletteType.rgbWithBlue,
                                onHistoryChanged: (value) {

                                },
                                onColorChanged: (color) {
                                  selectedDcolor = color;
                                  setState(() {});
                                },
                            ),

                            // BlockPicker(
                            //     pickerColor: selectedDcolor,
                            //     availableColors: colorHistory,
                            //     onColorChanged: (color) {
                            //       selectedDcolor = color;
                            //       setState(() {});
                            //     },
                            // ),

                            //Circular shape
                            // HueRingPicker(
                            //     pickerColor: selectedDcolor,
                            //     onColorChanged: (color) {
                            //       selectedDcolor = color;
                            //       setState(() {});
                            //     },
                            // ),

                            // MaterialPicker(
                            //     pickerColor: selectedDcolor,
                            //     onColorChanged: (color) {
                            //       selectedDcolor = color;
                            //       setState(() {});
                            //     },
                            // ),


                            // SlidePicker(
                            //     pickerColor: selectedDcolor,
                            //     onColorChanged: (color) {
                            //       selectedDcolor = color;
                            //       setState(() {});
                            //     },
                            // ),


                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.deepOrange,
                                child: const Text(
                                  'Select Color',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: selectedDcolor,
                child: const Text(
                  'Pick Color',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

            ],
          ),
        ));
  }
}