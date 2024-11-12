import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'chart_screen/display_data.dart';
import 'chart_screen/data_generation.dart';

import 'package:greenfarm_capstone_project/utils/constants/colors.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Sensor Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSensorCard(
              context,
              title: 'Water Level',
              value: '75%',
              subtitle: 'Good',
              color: TColors.secondary2,
              onTap: () {
                _navigateToDetail(
                  context,
                  title: 'Water Level',
                  description: 'Real-time monitoring of soil moisture for optimal irrigation management.',
                  chartData: getWaterLevelChartData(), // Get Water Level data
                  insights: [
                    'Water levels peaked at 12 PM, indicating potential over-irrigation during midday.',
                  ],
                  recommendations: [
                    'Water levels dropped below 30% around 6 AM, consider scheduling irrigation during early morning hours.',
                  ],
                  lastUpdated: '12h36m',
                  chartType: 'waterLevel',
                );
              },
            ),
            const SizedBox(height: 16),
            _buildSensorCard(
              context,
              title: 'Air Temperature',
              value: '+25°C',
              subtitle: 'Good',
              color: TColors.secondary3,
              onTap: () {
                _navigateToDetail(
                  context,
                  title: 'Air Temperature',
                  description: 'Air temperature affects plant growth, water evaporation, and overall soil conditions.',
                  chartData: getAirTemperatureChartData(), // Get Temperature data
                  insights: ['Temperatures peaked at 2 PM, indicating high solar exposure in the afternoon.'],
                  recommendations: ['High temperatures during midday may require additional irrigation to prevent soil drying.'],
                  lastUpdated: '12h36m',
                  chartType: 'temperature',
                );
              },
            ),
            const SizedBox(height: 16),
            _buildSensorCard(
              context,
              title: 'Soil Nutrients',
              value: '80 PPM',
              subtitle: 'Good',
              color: TColors.secondary4,
              onTap: () {
                _navigateToDetailWithMultipleLines(
                  context,
                  title: 'Soil Nutrients',
                  description: 'Real-time monitoring of soil nutrient levels for optimal crop health.',
                  nitrogenData: getNitrogenChartData(),
                  phosphorusData: getPhosphorusChartData(),
                  kaliData: getKaliChartData(),
                  insights: [
                    'Nitrogen levels peaked at noon, suggesting high uptake during the midday period.',
                  ],
                  recommendations: [
                    'Consider adding phosphorus-based fertilizer in the evening for optimal soil balance.',
                  ],
                  lastUpdated: '12h36m',
                  chartType: 'soilNutrients',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorCard(
      BuildContext context, {
        required String title,
        required String value,
        required String subtitle,
        required Color color,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetail(
      BuildContext context, {
        required String title,
        required String description,
        required List<FlSpot> chartData,
        required List<String> insights,
        required List<String> recommendations,
        required String lastUpdated,
        required String chartType,
      }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayDataScreen(
          title: title,
          description: description,
          temperatureData: chartType == 'temperature' ? chartData : [],
          waterLevelData: chartType == 'waterLevel' ? chartData : [],
          nitrogenData: [],
          phosphorusData: [],
          kaliData: [],
          insights: insights,
          recommendations: recommendations,
          lastUpdated: lastUpdated,
          chartType: chartType,
        ),
      ),
    );
  }

  void _navigateToDetailWithMultipleLines(
      BuildContext context, {
        required String title,
        required String description,
        required List<FlSpot> nitrogenData,
        required List<FlSpot> phosphorusData,
        required List<FlSpot> kaliData,
        required List<String> insights,
        required List<String> recommendations,
        required String lastUpdated,
        required String chartType,
      }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayDataScreen(
          title: title,
          description: description,
          temperatureData: [],
          waterLevelData: [],
          nitrogenData: nitrogenData,
          phosphorusData: phosphorusData,
          kaliData: kaliData,
          insights: insights,
          recommendations: recommendations,
          lastUpdated: lastUpdated,
          chartType: 'soilNutrients',
        ),
      ),
    );
  }
}
