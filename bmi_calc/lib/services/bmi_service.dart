class BMIService {

  double calculateBMI(double weightKg, double heightCm) {
    final double heightM = heightCm / 100.0;
    
    return weightKg / (heightM * heightM);
  }

  String getBMICategory(double bmi) {
    if (bmi < 16.0) {
      return "Starkes Untergewicht";
    } else if (bmi < 17.0) {
      return "Mäßiges Untergewicht";
    } else if (bmi < 18.5) {
      return "Leichtes Untergewicht";
    } else if (bmi < 25.0) {
      return "Normalgewicht";
    } else if (bmi < 30.0) {
      return "Präadipositas (Übergewicht)";
    } else if (bmi < 35.0) {
      return "Adipositas Grad I";
    } else if (bmi < 40.0) {
      return "Adipositas Grad II";
    } else {
      return "Adipositas Grad III";
    }
  }
}