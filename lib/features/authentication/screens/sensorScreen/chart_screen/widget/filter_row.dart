import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const FilterRow({
    Key? key,
    required this.selectedFilter,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: ['Today', 'Week', 'Month', 'Year'].map((filter) {
        bool isSelected = selectedFilter == filter;
        return GestureDetector(
          onTap: () => onFilterChanged(filter),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Text(
                  filter,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? Colors.green : Colors.black,
                    fontSize: 10,
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    height: 2,
                    width: 40,
                    color: Colors.green,
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
