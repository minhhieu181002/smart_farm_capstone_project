import 'package:flutter/material.dart';
import 'package:greenfarm_capstone_project/utils/constants/colors.dart';
import 'package:greenfarm_capstone_project/utils/constants/image_strings.dart';
import 'statusOfIrrigation/widget/irrigationCard.dart';
import 'history/historyScreen.dart';
class IrrigationScreen extends StatelessWidget {
  const IrrigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime historyDate = DateTime.now();
    return DefaultTabController(
      length: 2, // Two tabs: Status and History
      child: Scaffold(
        body: Column(
          children: [
            // TabBar at the top of the body
            Container(
              color: Colors.white, // Background color for the TabBar
              child: const TabBar(
                labelColor: TColors.accent, // Selected tab text color
                unselectedLabelColor: Colors.black, // Unselected tab text color
                indicatorColor: TColors.accent, // Indicator color
                tabs: [
                  Tab(text: "Status of Irrigation"),
                  Tab(text: "History"),
                ],
              ),
            ),

            // TabBarView to display the content of each tab
            Expanded(
              child: TabBarView(
                children: [
                  // Status of Irrigation Tab with IrrigationCard widgets
                  ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      IrrigationCard(
                        imageUrl: TImages.mangoTree,
                        waterLevelStatus: 'Full',
                        waterLevelIconPath: TImages.waterLevelFull,
                        pumpStatus: 'Auto',
                      ),
                      IrrigationCard(
                        imageUrl: TImages.duagangTree,
                        waterLevelIconPath: TImages.waterLevelLow,
                        waterLevelStatus: 'Low',
                        pumpStatus: 'Manual',
                      ),
                      IrrigationCard(
                        imageUrl: TImages.pineappleTree,
                        waterLevelIconPath: TImages.waterLevelMedium,
                        waterLevelStatus: 'Medium',
                        pumpStatus: 'Auto',
                      ),
                    ],
                  ),

                  // History Tab (can be populated later)
                  HistoryScreen(date: historyDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




