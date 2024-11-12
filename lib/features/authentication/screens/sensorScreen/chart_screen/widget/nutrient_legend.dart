import 'package:flutter/material.dart';

class NutrientLegend extends StatelessWidget {
  final Map<String, Color> nutrientColors;

  const NutrientLegend({Key? key, required this.nutrientColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: nutrientColors.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: entry.value,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Text(entry.key, style: TextStyle(fontSize: 10)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
