import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:greenfarm_capstone_project/utils/helpers/chart_helper.dart';
import 'filter_row.dart';

class TemperatureChart extends StatelessWidget {
  final List<FlSpot> temperatureData;
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const TemperatureChart({
    Key? key,
    required this.temperatureData,
    required this.selectedFilter,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterRow(selectedFilter: selectedFilter, onFilterChanged: onFilterChanged),
          const SizedBox(height: 32),
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: temperatureData,
                    isCurved: true,
                    color: Colors.orange,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                ],
                titlesData: ChartHelpers.buildTitlesData('°C', 10),
                minY: 0,
                maxY: 40,
                borderData: ChartHelpers.buildBorderData(),
                gridData: ChartHelpers.buildGridData(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
