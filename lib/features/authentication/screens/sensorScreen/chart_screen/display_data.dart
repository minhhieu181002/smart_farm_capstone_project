import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'widget/temperature_chart.dart';
import 'widget/water_level_chart.dart';
import 'widget/soil_nutrient_chart.dart';
import 'package:greenfarm_capstone_project/utils/constants/colors.dart';

class DisplayDataScreen extends StatelessWidget {
  final String title;
  final String description;
  final List<FlSpot> temperatureData;
  final List<FlSpot> waterLevelData;
  final List<FlSpot> nitrogenData;
  final List<FlSpot> phosphorusData;
  final List<FlSpot> kaliData;
  final List<String> insights;
  final List<String> recommendations;
  final String lastUpdated;
  final String chartType;

  //final String selectedFilter; // Pass in the filter value
  //final ValueChanged<String> onFilterChanged; // Callback for filter change

  const DisplayDataScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.temperatureData,
    required this.waterLevelData,
    required this.nitrogenData,
    required this.phosphorusData,
    required this.kaliData,
    required this.insights,
    required this.recommendations,
    required this.lastUpdated,
    required this.chartType,
    //required this.selectedFilter, // Add selected filter as parameter
    //required this.onFilterChanged, // Add callback as parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget chartWidget;
    if (chartType == 'temperature') {
      chartWidget = TemperatureChart(
        temperatureData: temperatureData,
        selectedFilter: 'Today',
        //onFilterChanged: onFilterChanged,
      );
    } else if (chartType == 'waterLevel') {
      chartWidget = WaterLevelChart(
        waterLevelData: waterLevelData,
        selectedFilter: 'Today',
        //onFilterChanged: onFilterChanged,
      );
    } else if (chartType == 'soilNutrients') {
      chartWidget = SoilNutrientsChart(
        nitrogenData: nitrogenData,
        phosphorusData: phosphorusData,
        kaliData: kaliData,
        selectedFilter: 'Today',
        //onFilterChanged: onFilterChanged,
      );
    } else {
      chartWidget =
          Center(child: Text("No data available for this chart type."));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme
                .of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: TColors.accent)),
            const SizedBox(height: 8),
            Text(description, style: Theme
                .of(context)
                .textTheme
                .bodyMedium),
            const SizedBox(height: 20),
            chartWidget,
            const SizedBox(height: 20),
            _buildInsights(),
            const SizedBox(height: 20),
            _buildRecommendations(),
            const SizedBox(height: 20),
            Text("Sensor last updated: $lastUpdated", style: Theme
                .of(context)
                .textTheme
                .bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildInsights() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Key Insight",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            ...insights.map((insight) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text("• $insight"),
            )),
          ],
        );
      },
    );
  }


  Widget _buildRecommendations() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recommendation",
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            ...recommendations.map((recommendation) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text("• $recommendation"),
                )),
          ],
        );
      },
    );
  }
}