import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultScreen extends StatelessWidget {
  final String label;
  final String? imagePath;
  ResultScreen(this.label, this.imagePath, {Key? key}) : super(key: key) {
    tts.speak('The object is $label');
  }
  FlutterTts tts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              minimum: EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Image.file(
                          File(imagePath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'The object is $label',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                onDoubleTap: () => tts.speak('The object is $label'),
                onTap: () => Navigator.pop(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
