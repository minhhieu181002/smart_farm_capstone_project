import 'package:flutter/material.dart';
import '../schedulePage/schedule.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenfarm_capstone_project/utils/constants/sizes.dart';
import 'package:greenfarm_capstone_project/utils/constants/colors.dart';

class IrrigationCard extends StatelessWidget {
  final String imageUrl;
  final String waterLevelIconPath; // Path for the SVG icon
  final String waterLevelStatus;
  final String pumpStatus;

  const IrrigationCard({
    Key? key,
    required this.imageUrl,
    required this.waterLevelIconPath, // SVG path
    required this.waterLevelStatus,
    required this.pumpStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: TColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Column 1: Image section
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Column 2: Water level icon
            SvgPicture.asset(
              waterLevelIconPath,
            ),
            const SizedBox(width: 12),

            // Column 3: Information and Schedule button
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: Water level status
                  Row(
                    children: [
                      const Text(
                        'Water Level: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: TSizes.fontSizeSm,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            waterLevelStatus,
                            style: TextStyle(
                              fontSize: TSizes.fontSizeSm,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Row 2: Pump status
                  Row(
                    children: [
                      const Text(
                        'Pump Status: ',
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: TSizes.fontSizeSm),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            pumpStatus,
                            style: TextStyle(
                              fontSize: TSizes.fontSizeSm,
                            ),
                          ),
                          ),
                        ),
                    ],
                  ),


                  const SizedBox(height: 24),

                  // Row 3: Schedule button with arrow icon
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const SchedulePage()),
                        ); // Navigate to new blank page
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Schedule',
                            style: TextStyle(
                              color: TColors.accent,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios, size: 16, color: TColors.accent),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
