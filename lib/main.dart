import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String? _imageDate;
  String? _nativeString;

  static const platform = MethodChannel('com.example/native_demo_app');

  Future<void> _getNativeString() async {
    try {
      final String result = await platform.invokeMethod('getStaticString');
      setState(() {
        _nativeString = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        _nativeString = "Failed to get native string: '${e.message}'";
      });
    }
  }

  Future<void> _takePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imageDate = DateFormat('yyyy-MM-dd – kk:mm').format(
          File(pickedFile.path).lastModifiedSync(),
        );
      }
    });
  }
  void _showDateDialog() {
    _getNativeString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.all(20),

          content: Text(
            _nativeString != null ? _nativeString! : 'No native string',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
				title: Text('lab14'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
			),
      body: Stack(
        children: [
          Center(
            child: _image == null
                ? Text('No image')
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.file(
                  _image!,
                  height: 500,
                  width: 500,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: OutlinedButton(
                onPressed: _showDateDialog,
                child: Text('Show Native String'),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _takePicture,
              tooltip: 'Take Picture',
              child: Icon(Icons.camera),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CameraApp(),
    );
  }
}
