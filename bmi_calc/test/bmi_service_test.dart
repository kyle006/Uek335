//Mit AI generiert
import 'package:test/test.dart';
import 'package:bmi_calc/services/bmi_service.dart';

void main() {
  late BMIService bmiService;
  
  setUp(() {
    bmiService = BMIService();
  });
  
  group('BMIService calculateBMI Tests', () {
    test('calculateBMI sollte bei normalen Werten korrekten BMI zurückgeben', () {
      const double weight = 70.0;
      const double height = 175.0;
      const double expectedBMI = 22.86;
      
      final double actualBMI = bmiService.calculateBMI(weight, height);
      
      expect(actualBMI, closeTo(expectedBMI, 0.01));
    });
    
    test('calculateBMI sollte bei Untergewichts-Werten korrekten BMI zurückgeben', () {
      const double weight = 50.0;
      const double height = 180.0;
      const double expectedBMI = 15.43;
      
      final double actualBMI = bmiService.calculateBMI(weight, height);
      
      expect(actualBMI, closeTo(expectedBMI, 0.01));
    });
    
    test('calculateBMI sollte bei Übergewichts-Werten korrekten BMI zurückgeben', () {
      const double weight = 100.0;
      const double height = 170.0;
      const double expectedBMI = 34.60;
      
      final double actualBMI = bmiService.calculateBMI(weight, height);
      
      expect(actualBMI, closeTo(expectedBMI, 0.01));
    });
  });
  
  group('BMIService getBMICategory Tests', () {
    test('getBMICategory sollte bei starkem Untergewicht korrekte Kategorie zurückgeben', () {
      expect(bmiService.getBMICategory(15.5), equals("Starkes Untergewicht"));
    });
    
    test('getBMICategory sollte bei mäßigem Untergewicht korrekte Kategorie zurückgeben', () {
      expect(bmiService.getBMICategory(16.5), equals("Mäßiges Untergewicht"));
    });
    
    test('getBMICategory sollte bei leichtem Untergewicht korrekte Kategorie zurückgeben', () {
      expect(bmiService.getBMICategory(18.0), equals("Leichtes Untergewicht"));
    });
    
    test('getBMICategory sollte bei Normalgewicht korrekte Kategorie zurückgeben', () {
      expect(bmiService.getBMICategory(22.0), equals("Normalgewicht"));
    });
    
    test('getBMICategory sollte bei Übergewicht korrekte Kategorie zurückgeben', () {
      expect(bmiService.getBMICategory(27.0), equals("Präadipositas (Übergewicht)"));
    });
    
    test('getBMICategory sollte bei Adipositas Grad I korrekte Kategorie zurückgeben', () {
      expect(bmiService.getBMICategory(32.0), equals("Adipositas Grad I"));
    });
    
    test('getBMICategory sollte bei Adipositas Grad II korrekte Kategorie zurückgeben', () {
      expect(bmiService.getBMICategory(37.0), equals("Adipositas Grad II"));
    });
    
    test('getBMICategory sollte bei Adipositas Grad III korrekte Kategorie zurückgeben', () {
      expect(bmiService.getBMICategory(42.0), equals("Adipositas Grad III"));
    });
  });
}