import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String responseText = 'Noch keine Daten gesendet';
  bool isLoading = false;

  Future<void> sendRequest() async {
    setState(() {
      isLoading = true;
    });
    String currentTime = DateFormat(
      "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
    ).format(DateTime.now());
    String deviceName = Platform.operatingSystem;
    try {
      final response = await http.post(
        Uri.parse('https://httpbin.org/post'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'deviceName': deviceName,
          'currentTime': currentTime,
        }),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          responseText = responseData['json'].toString();
        });
      } else {
        setState(() {
          responseText = 'Fehler: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        responseText = 'Netzwerkfehler: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello HTTP')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(responseText, textAlign: TextAlign.center),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: isLoading ? null : sendRequest,
                  child: Text('Send Device Info'),
                ),
          ],
        ),
      ),
    );
  }
}
 