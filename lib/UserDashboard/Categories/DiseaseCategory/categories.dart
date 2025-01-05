import 'package:flutter/material.dart';
import '../CommonScreens/Diet/recommended_foods_screen.dart';
import 'Screens/Precautions/Do.dart';
import 'Screens/Symptoms/symptoms_navigation_screen.dart';
import '../CommonScreens/AI assistant/ai_assistant_screen.dart';

class NewScreen extends StatelessWidget {
  final String categoryTitle;

  // Constructor to receive category title
  NewScreen({required this.categoryTitle});

  final List<Map<String, dynamic>> gridItems = [
    {'title': 'Symptoms', 'icon': Icons.sick},
    {'title': 'Precautions', 'icon': Icons.security},
    {'title': 'Prediction', 'icon': Icons.analytics},
    {'title': 'Diet', 'icon': Icons.restaurant},
    {'title': 'Doctor', 'icon': Icons.medical_services},
    {'title': 'AI Consultant', 'icon': Icons.smart_toy},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          '$categoryTitle Features', // Dynamic title
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: gridItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = gridItems[index];
            return Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  if (item['title'] == 'Diet') {
                    // Navigate to the Recommended Foods Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecommendedFoodsScreen()),
                    );
                  } else if (item['title'] == 'Precautions') {
                    // Navigate to the Precautions Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DosScreen()),
                    );
                  }
                  else if (item['title'] == 'Symptoms') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SymptomsNavigationScreen()),
                    );
                  }

                  else if (item['title'] == 'AI Consultant') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AIAssistantScreen()),
                    );
                  }
                  else {
                    // Handle other categories
                    print('${item['title']} tapped in $categoryTitle');
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 48, color: Colors.deepPurple),
                    SizedBox(height: 8),
                    Text(
                      item['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
