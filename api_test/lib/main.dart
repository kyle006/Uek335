import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MotivationApp());
}

class MotivationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MotivationScreen(),
    );
  }
}

class MotivationScreen extends StatefulWidget {
  @override
  _MotivationScreenState createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  String _quote = "Klicke auf den Button, um ein Zitat zu erhalten!";
  String _author = "";

  Future<void> _fetchQuote() async {
    const url = 'https://zenquotes.io/api/random';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _quote = data[0]['q']; // Zitat holen
        _author = data[0]['a']; // Autor holen
      });
    } else {
      setState(() {
        _quote = "Fehler beim Laden des Zitats!";
        _author = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Motivations-Zitate")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _quote,
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              _author.isNotEmpty ? "- $_author" : "",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchQuote,
              child: Text("Neues Zitat"),
            ),
          ],
        ),
      ),
    );
  }
}
