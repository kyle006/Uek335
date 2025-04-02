import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(SensorDifferenceApp());
}

class SensorDifferenceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SensorScreen(),
    );
  }
}

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  double x = 0.0, y = 0.0, z = 0.0;
  StreamSubscription? _accelerometerSubscription;
  bool _isShaking = false;
  Color _shakeColor = Colors.black; // Default color

  @override
void initState() {
  super.initState();
  _accelerometerSubscription = accelerometerEvents.listen((event) {
    setState(() {
      x = event.x;
      y = event.y;
      z = event.z;

      double magnitude = sqrt(x * x + y * y + z * z);

      if (magnitude > 10 && !_isShaking) {
        _isShaking = true;
        setState(() {
          _shakeColor = _generateRandomColor();
        });
      } else if (magnitude <= 10 && _isShaking) {
        _isShaking = false;
      }
    });
  });
}

// Add this helper method to generate random colors
Color _generateRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Sensor Difference")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Current Values:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Container(
            color: Colors.red[100],
            child: Text("x: ${x.toStringAsFixed(2)}"),
          ),
          Container(
            color: Colors.green[100],
            child: Text("y: ${y.toStringAsFixed(2)}"),
          ),
          Container(
            color: Colors.blue[100],
            child: Text("z: ${z.toStringAsFixed(2)}"),
          ),
          SizedBox(height: 20),
          if (_isShaking)
            Text(
              "Shake detected!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _shakeColor),
          ),
        ],
      ),
    ),
  );
}

@override
void dispose() {
  _accelerometerSubscription?.cancel();
  super.dispose();
}
}

