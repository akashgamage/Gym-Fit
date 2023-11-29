import 'package:flutter/material.dart';
import 'package:flutter_application_1test2/pages/add/addmeal.dart';

import 'MyMeals.dart';
import 'MySupplements.dart';
import 'MyVitamins.dart';

class ReminderPage extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/Card 1.png',
    'assets/Card 2.png',
    'assets/Card 3.png',
  ];

  final List<String> titles = [
    'My Meals >',
    'My Supplements >',
    'My Vitamins >',
  ];

  final List<String> subtitles = [
    'Easy access to your meals',
    'Easy access to your supplements',
    'Easy access to your vitamins',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF944653), Color(0xFF434B63)],
          ),
        ),
        child: ListView(
          children: [
            for (int index = 0; index < 3; index++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 5,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the corresponding page when the image is tapped
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddMealPage(),
                                ),
                              );
                            } else if (index == 1) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MySupplementsPage();
                                  },
                                ),
                              );
                            } else if (index == 2) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return MyVitaminsPage();
                                  },
                                ),
                              );
                            }
                          },
                          child: Container(
                            child: Image.asset(
                              imageUrls[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
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
