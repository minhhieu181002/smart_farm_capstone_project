import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

// Function to generate random data points for a given chart
List<FlSpot> generateChartData({
  required int numberOfPoints,
  required double minY,
  required double maxY,
}) {
  final random = Random();
  List<FlSpot> data = [];

  for (int i = 0; i < numberOfPoints; i++) {
    // Generate a random y value between minY and maxY
    double yValue = minY + random.nextDouble() * (maxY - minY);

    // Use time points like 0, 6, 12, 18, and 24 for uniform x-axis spacing (can be customized as needed)
    double xValue = (i == 0) ? 0 : i * (24 / (numberOfPoints - 1));

    data.add(FlSpot(xValue, yValue));
  }
  return data;
}

// Example usage of generateChartData
List<FlSpot> getWaterLevelChartData() => generateChartData(
  numberOfPoints: 50,
  minY: 20,
  maxY: 100,
);

List<FlSpot> getAirTemperatureChartData() => generateChartData(
  numberOfPoints: 10,
  minY: 20,
  maxY: 40,
);

List<FlSpot> getNitrogenChartData() => generateChartData(
  numberOfPoints: 10,
  minY: 50,
  maxY: 250,
);

List<FlSpot> getPhosphorusChartData() => generateChartData(
  numberOfPoints: 10,
  minY: 50,
  maxY: 250,
);

List<FlSpot> getKaliChartData() => generateChartData(
  numberOfPoints: 10,
  minY: 50,
  maxY: 250,
);
