import 'package:aibuddy/core/widgets/glass_button.dart';
import 'package:aibuddy/features/home_page/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.lerp(Colors.black, Colors.white, 0.1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.4,
                  height: height * 0.043,
                  decoration: BoxDecoration(
                      color: Color.lerp(Colors.indigo, Colors.white, 0.2),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'Personal AI Buddy',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          wordSpacing: 3,
                          fontFamily: 'Josefin Sans'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/im1.png',
                height: height * 0.3,
              ),
            ],
          ),
          SizedBox(height: height * 0.1),
          const Text(
            'Where Conversations\n\t\t\t\t\t\tMeet Solutions',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Josefin Sans'),
          ),
          SizedBox(height: height * 0.02),
          const Text(
            'AI buddy can answer any of your\n\t\t\t\t\t\t\t\t\t\t\t\tquestion, Just ask!',
            style: TextStyle(
                color: Colors.white30,
                fontSize: 15,
                fontFamily: 'Josefin Sans'),
          ),
          SizedBox(height: height * 0.17),
          GlassButton(
              text: 'Start a Conversation',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              }),
        ],
      ),
    );
  }
}
