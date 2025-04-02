import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

void main() {
  runApp(SnapItApp());
}

class SnapItApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnapIt',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    final savedImage = await _saveImage(File(image.path));
    setState(() {
      _image = savedImage;
    });
  }

  Future<File> _saveImage(File image) async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, basename(image.path));
    return image.copy(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SnapIt')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text('Kein Bild aufgenommen')
                : Image.file(_image!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takePicture,
              child: Text('Foto aufnehmen'),
            ),
          ],
        ),
      ),
    );
  }
}
