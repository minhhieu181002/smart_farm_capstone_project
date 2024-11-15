import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:greenfarm_capstone_project/utils/helpers/chart_helper.dart';
import 'package:greenfarm_capstone_project/utils/constants/colors.dart';
import 'filter_row.dart';

class WaterLevelChart extends StatelessWidget {
  final List<FlSpot> waterLevelData;
  final String selectedFilter;
  //final Function(String) onFilterChanged;

  const WaterLevelChart({
    Key? key,
    required this.waterLevelData,
    required this.selectedFilter,
    //required this.onFilterChanged,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: TColors.secondary3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterRow(selectedFilter: selectedFilter),
          const SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: waterLevelData,
                    isCurved: true,
                    color: TColors.lineBlueWater,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                ],
                titlesData: ChartHelpers.buildTitlesData('%', 20),
                minY: 0,
                maxY: 100,
                borderData: ChartHelpers.buildBorderData(),
                gridData: ChartHelpers.buildGridData(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
