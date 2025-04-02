import 'package:flutter/material.dart';
import '../services/bmi_service.dart';

class ResultScreen extends StatelessWidget {
  final double weight;
  final double height;
  final BMIService _bmiService = BMIService();

  ResultScreen({
    Key? key,
    required this.weight,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double bmi = _bmiService.calculateBMI(weight, height);
    final String category = _bmiService.getBMICategory(bmi);

    Color categoryColor;
    if (bmi < 18.5) {
      categoryColor = Colors.blue;
    } else if (bmi < 25) {
      categoryColor = Colors.green;
    } else if (bmi < 30) {
      categoryColor = Colors.orange;
    } else {
      categoryColor = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ihr BMI Ergebnis'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                Text(
                  bmi.toStringAsFixed(1),
                  style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category,
                  style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: categoryColor,
                  ),
                ),
                ],
              ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Berechnet für ${weight.toStringAsFixed(1)} kg und ${height.toStringAsFixed(1)} cm',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => ResultScreen(
                  weight: weight,
                  height: height,
                ),
                ),
              );
              },
              style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
              'Zurück',
              style: TextStyle(fontSize: 18),
              ),
            ),
            ],
        ),
      ),
    );
  }
}