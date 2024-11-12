import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'widget/temperature_chart.dart';
import 'widget/water_level_chart.dart';
import 'widget/soil_nutrient_chart.dart';
import 'widget/nutrient_legend.dart';

class DisplayDataScreen extends StatefulWidget {
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
  }) : super(key: key);

  @override
  _DisplayDataScreenState createState() => _DisplayDataScreenState();
}

class _DisplayDataScreenState extends State<DisplayDataScreen> {
  String selectedFilter = 'Today';

  void _loadChartData() {
    print('Loading data for $selectedFilter');
  }

  @override
  Widget build(BuildContext context) {
    Widget chartWidget;
    if (widget.chartType == 'temperature') {
      chartWidget = TemperatureChart(
        temperatureData: widget.temperatureData,
        selectedFilter: selectedFilter,
        onFilterChanged: (filter) {
          setState(() {
            selectedFilter = filter;
            _loadChartData();
          });
        },
      );
    } else if (widget.chartType == 'waterLevel') {
      chartWidget = WaterLevelChart(
        waterLevelData: widget.waterLevelData,
        selectedFilter: selectedFilter,
        onFilterChanged: (filter) {
          setState(() {
            selectedFilter = filter;
            _loadChartData();
          });
        },
      );
    } else if (widget.chartType == 'soilNutrients') {
      chartWidget = SoilNutrientsChart(
        nitrogenData: widget.nitrogenData,
        phosphorusData: widget.phosphorusData,
        kaliData: widget.kaliData,
        selectedFilter: selectedFilter,
        onFilterChanged: (filter) {
          setState(() {
            selectedFilter = filter;
            _loadChartData();
          });
        },
      );
    } else {
      chartWidget = Center(child: Text("No data available for this chart type."));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.green)),
            const SizedBox(height: 8),
            Text(widget.description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),
            chartWidget,
            const SizedBox(height: 20),
            _buildInsights(),
            const SizedBox(height: 20),
            _buildRecommendations(),
            const SizedBox(height: 20),
            Text("Sensor last updated: ${widget.lastUpdated}", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildInsights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Key Insight", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        ...widget.insights.map((insight) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text("• $insight"),
        )),
      ],
    );
  }

  Widget _buildRecommendations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recommendation", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        ...widget.recommendations.map((recommendation) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text("• $recommendation"),
        )),
      ],
    );
  }
}
