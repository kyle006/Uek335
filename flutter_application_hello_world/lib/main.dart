import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hallo Welt',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HalloWeltPage(),
    );
  }
}

class HalloWeltPage extends StatelessWidget {
  const HalloWeltPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hallo Welt'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Text(
          'Hallo Welt',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}