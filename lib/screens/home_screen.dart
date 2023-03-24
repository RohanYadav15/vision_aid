import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:know_around/backend/machine_vision.dart';
import 'package:know_around/screens/result_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showAnimation = false;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  final FlutterTts tts = FlutterTts();
  MachineVision vision = MachineVision();

  @override
  void initState() {
    super.initState();
    tts.speak("Tap To Take Picture");
    // vision.authenticate();
  }

  void takeImage() async {
    _image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 40);
    if (_image == null) {
      await tts.speak("Image not taken");
    } else {
      setState(() => showAnimation = true);
      await tts.speak("Image Taken, Please wait for results");
      await Future.delayed(Duration(seconds: 3));
      setState(() => showAnimation = false);
      // await vision.authenticate();
      print('I am here 2');
      String label = await vision.getLabels(_image?.path);
      //Implement code for labelling
      print('I am here 3');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultScreen(label, _image?.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vision Aid')),
      body: showAnimation
          ? Lottie.asset('assets/loading_animation.json')
          : GestureDetector(
              onTap: takeImage,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Tap to take Picture",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
    );
  }
}
