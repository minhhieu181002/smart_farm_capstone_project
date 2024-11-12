import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartHelpers {
  static FlTitlesData buildTitlesData(String unit, double leftInterval) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 6,
          getTitlesWidget: (value, meta) {
            switch (value.toInt()) {
              case 0: return Text("00", style: TextStyle(fontSize: 10));
              case 6: return Text("06", style: TextStyle(fontSize: 10));
              case 12: return Text("12", style: TextStyle(fontSize: 10));
              case 18: return Text("18", style: TextStyle(fontSize: 10));
              case 24: return Text("24", style: TextStyle(fontSize: 10));
              default: return Container();
            }
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: leftInterval,
          reservedSize: 30,
          getTitlesWidget: (value, meta) {
            return Text('${value.toInt()}$unit', style: TextStyle(fontSize: 10));
          },
        ),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  static FlBorderData buildBorderData() {
    return FlBorderData(
      show: true,
      border: Border(
        left: BorderSide(color: Colors.black, width: 1),
        bottom: BorderSide(color: Colors.black, width: 1),
      ),
    );
  }

  static FlGridData buildGridData(double interval) {
    return FlGridData(
      show: true,
      horizontalInterval: interval,
      drawVerticalLine: false,
      drawHorizontalLine: false,
    );
  }
}
