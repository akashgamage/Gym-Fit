import 'package:flutter/material.dart';
import 'package:flutter_application_1test2/pages/firstpages/Reminder.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF944653),
              Color(0xFF434B63)
            ], // Define your gradient colors here
          ),
        ),
        child: ListView(
          children: [
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Hello Akash,',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  LongButton(
                    imageAsset: 'assets/Paper.png',
                    description: 'You can access your schedule',
                    title: 'Shedule',
                    backgroundColor: Color.fromARGB(255, 44, 44, 46),
                    onTap: () {
                      // Handle button tap action
                    },
                  ),
                  LongButton(
                    imageAsset: 'assets/Swap.png',
                    description: 'Measure your progress',
                    title: 'Progress',
                    backgroundColor: Color.fromARGB(255, 44, 44, 46),
                    onTap: () {
                      // Handle button tap action
                    },
                  ),
                  LongButton(
                    imageAsset: 'assets/Graph.png',
                    description: 'Set reminders for meals, vitamins...',
                    title: 'Reminder',
                    backgroundColor: Color.fromARGB(255, 44, 44, 46),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReminderPage(),
                        ),
                      );
                    },
                  ),
                  LongButton(
                    imageAsset: 'assets/Calender.png',
                    description: 'Access your calendar with details',
                    title: 'Calender',
                    backgroundColor: Color.fromARGB(255, 44, 44, 46),
                    onTap: () {
                      // Handle button tap action
                    },
                  ),
                  LongButton(
                    imageAsset: 'assets/Profile.png',
                    description: 'Submit your feedback',
                    title: 'Feedback',
                    backgroundColor: Color.fromARGB(255, 44, 44, 46),
                    onTap: () {
                      // Handle button tap action
                    },
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
                  horizontal: displayWidth * .025,
                  vertical: displayWidth * .025),
              child: Row(
                children: [
                  Image.asset(
                    imageAsset,
                    width: displayWidth * .20,
                    height: displayWidth * .20,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: displayWidth * .04),
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
                    size: displayWidth * .05,
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
