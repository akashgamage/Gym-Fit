import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> stationNames = [
    'Nebula Station Los Alamos - Earth',
    'Option 2 - Earth',
    'Nebula Station Elysium Colony - Mars',
    'Option 2 - Mars',
  ];

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2160),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    // double accountButtonHeight = 75.0;
    // double spaceBetweenButtons = 16.0;

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(displayWidth * .05),
              child: SizedBox(
                height: displayWidth * 1.4,
                width: double.infinity,
                child: ListView(
                  children: [
                    LongButton(
                      imageAsset: 'assets/images/travel1.png',
                      description: 'Description',
                      title: 'Nebula Shuttle X',
                      backgroundColor: Color.fromARGB(255, 9, 0, 136),
                      onTap: () {
                        // Handle button tap action
                      },
                    ),
                    LongButton(
                      imageAsset: 'assets/images/travel2.png',
                      description: 'Description',
                      title: 'Nebula Z11',
                      backgroundColor: Color.fromARGB(255, 255, 42, 42),
                      onTap: () {
                        // Handle button tap action
                      },
                    ),
                    LongButton(
                      imageAsset: 'assets/images/travel2.png',
                      description: 'Description',
                      title: 'Nebula Z11',
                      backgroundColor: Color.fromARGB(255, 255, 42, 42),
                      onTap: () {
                        // Handle button tap action
                      },
                    ),
                    LongButton(
                      imageAsset: 'assets/images/travel2.png',
                      description: 'Description',
                      title: 'Nebula Z11',
                      backgroundColor: Color.fromARGB(255, 255, 42, 42),
                      onTap: () {
                        // Handle button tap action
                      },
                    ),
                    LongButton(
                      imageAsset: 'assets/images/travel3.png',
                      description: 'Description',
                      title: 'Nebula YX1',
                      backgroundColor: Color.fromARGB(255, 137, 161, 138),
                      onTap: () {
                        // Handle button tap action
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class LongButton extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;
  final Color backgroundColor;
  final VoidCallback onTap;

  const LongButton({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        width: displayWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(displayWidth * .04),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(displayWidth * .03),
            splashColor: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: displayWidth * .03,
                  vertical: displayWidth * .025),
              child: Row(
                children: [
                  Image.asset(
                    imageAsset,
                    width: displayWidth * .22,
                    height: displayWidth * .22,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: displayWidth * .05),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: displayWidth * .05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: displayWidth * .0125),
                        Text(
                          description,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: displayWidth * .06,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
