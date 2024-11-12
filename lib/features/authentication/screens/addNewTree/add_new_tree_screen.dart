import 'package:flutter/material.dart';

class AddNewTreeScreen extends StatefulWidget {
  const AddNewTreeScreen({Key? key}) : super(key: key);

  @override
  _AddNewTreeScreenState createState() => _AddNewTreeScreenState();
}

class _AddNewTreeScreenState extends State<AddNewTreeScreen> {
  final TextEditingController plantNameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController seasonController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final List<String> categories = [
    "Vegetable",
    "Fruit",
    "Flower",
    "Herb",
    "Industrial Tree",
    "Food Crops",
  ];
  final List<String> seasons = ["Spring", "Summer", "Autumn", "Winter"];

  List<String> selectedCategories = [];
  List<String> selectedSeasons = [];
  List<String> filteredCategories = [];
  bool isCategoryDropdownExpanded = false;
  bool isSeasonDropdownExpanded = false;

  @override
  void initState() {
    super.initState();
    filteredCategories = categories;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add a new tree",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildTextField("Plant Name", "Placeholder", plantNameController),
            const SizedBox(height: 16),
            _buildCategoryDropdown(),
            const SizedBox(height: 16),
            _buildSeasonDropdown(),
            const SizedBox(height: 16),
            _buildDateField(context, "Date", dateController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isCategoryDropdownExpanded = !isCategoryDropdownExpanded;
            });
          },
          child: AbsorbPointer(
            child: TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: "Category",
                hintText: "Choose the category of the tree",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: Icon(isCategoryDropdownExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              ),
            ),
          ),
        ),
        if (isCategoryDropdownExpanded)
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      filteredCategories = categories
                          .where((category) => category.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ...filteredCategories.map((category) {
                  return CheckboxListTile(
                    title: Text(category),
                    value: selectedCategories.contains(category),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedCategories.add(category);
                        } else {
                          selectedCategories.remove(category);
                        }
                        categoryController.text = selectedCategories.join(", ");
                      });
                    },
                  );
                }).toList(),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildSeasonDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSeasonDropdownExpanded = !isSeasonDropdownExpanded;
            });
          },
          child: AbsorbPointer(
            child: TextField(
              controller: seasonController,
              decoration: InputDecoration(
                labelText: "Planning Season",
                hintText: "Choose the best season(s) for planting",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: Icon(isSeasonDropdownExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              ),
            ),
          ),
        ),
        if (isSeasonDropdownExpanded)
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                ...seasons.map((season) {
                  return CheckboxListTile(
                    title: Text(season),
                    value: selectedSeasons.contains(season),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedSeasons.add(season);
                        } else {
                          selectedSeasons.remove(season);
                        }
                        seasonController.text = selectedSeasons.join(", ");
                      });
                    },
                  );
                }).toList(),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDateField(BuildContext context, String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              controller.text = "${pickedDate.toLocal()}".split(' ')[0];
            }
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
