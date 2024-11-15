import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:greenfarm_capstone_project/utils/helpers/chart_helper.dart';
import 'package:greenfarm_capstone_project/utils/constants/colors.dart';
import 'filter_row.dart';
import 'nutrient_legend.dart';

class SoilNutrientsChart extends StatelessWidget {
  final List<FlSpot> nitrogenData;
  final List<FlSpot> phosphorusData;
  final List<FlSpot> kaliData;
  final String selectedFilter;
  //final Function(String) onFilterChanged;

  const SoilNutrientsChart({
    Key? key,
    required this.nitrogenData,
    required this.phosphorusData,
    required this.kaliData,
    required this.selectedFilter,
    //required this.onFilterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: TColors.secondary4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 32.0),
                child: NutrientLegend(
                nutrientColors: {
                  'Nitrogen': TColors.lineBlue,
                  'Phosphorus': TColors.lineOrange,
                  'Kali': TColors.lineGreen,
                },
              ),
              ),
              FilterRow(selectedFilter: selectedFilter),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: nitrogenData,
                    isCurved: true,
                    color: TColors.lineBlue,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots: phosphorusData,
                    isCurved: true,
                    color: TColors.lineOrange,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots: kaliData,
                    isCurved: true,
                    color: TColors.lineGreen,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                  ),
                ],
                titlesData: ChartHelpers.buildTitlesData(' ', 50),
                minY: 0,
                maxY: 250,
                borderData: ChartHelpers.buildBorderData(),
                gridData: ChartHelpers.buildGridData(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
