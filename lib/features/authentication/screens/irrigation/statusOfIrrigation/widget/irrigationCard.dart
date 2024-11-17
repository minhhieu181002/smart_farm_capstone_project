import 'package:flutter/material.dart';
import '../schedulePage/schedule.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenfarm_capstone_project/utils/constants/sizes.dart';
import 'package:greenfarm_capstone_project/utils/constants/colors.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';


class IrrigationCard extends StatelessWidget {
  final String imageUrl;
  final String waterLevelIconPath; // Path for the SVG icon
  final String waterLevelStatus;
  final String pumpStatus;
  final bool manualPumpStatus;

  const IrrigationCard({
    Key? key,
    required this.imageUrl,
    required this.waterLevelIconPath, // SVG path
    required this.waterLevelStatus,
    required this.pumpStatus,
    required this.manualPumpStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: TColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Image, Water Level Icon, and Information
            Row(
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

                // Column 3: Water level status
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Row 2: Manual pump section
            Row(
              children: [
                const Text(
                  'Manual Pump: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TSizes.fontSizeSm,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight, // Align switch to the right
                    child: LiteRollingSwitch(
                      value: manualPumpStatus, // Initial value
                      width: TSizes.buttonWidth,
                      textOn: 'ON',
                      textOff: 'OFF',
                      colorOn: TColors.accent,
                      colorOff: TColors.accent,
                      iconOn: Icons.done,
                      iconOff: Icons.remove_circle_outline,
                      textSize: TSizes.fontSizeXs,
                      onChanged: (bool state) {
                        // Manage the switch states
                        print('Current State of SWITCH IS: $state');
                      },
                      onDoubleTap: () {},
                      onSwipe: () {},
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Row 3: Schedule button
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
                      'Set Schedule',
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
    );
  }
}


