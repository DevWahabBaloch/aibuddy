import 'package:aibuddy/core/widgets/icon_container.dart';
import 'package:aibuddy/core/widgets/recent_chat_tile.dart';
import 'package:aibuddy/features/chat_page/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.lerp(Colors.black, Colors.white, 0.1),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IconContainer(
                    iconString: 'assets/icons/menu.png',
                    quaterTurns: 2,
                    color: Color.fromARGB(135, 214, 214, 214),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.04, horizontal: width * 0.03),
                    child: Image.asset(
                      height: width * 0.1,
                      'assets/images/user_p.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hello,',
                              style: TextStyle(fontSize: 30, color: Colors.white70, fontFamily: 'Josefin Sans'),
                            ),
                            TextSpan(
                              text: 'Wahab',
                              style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Josefin Sans'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  const Text(
                    'How can I help you right now?',
                    style: TextStyle(fontSize: 18, color: Colors.white70, fontFamily: 'Josefin Sans'),
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 0, // Adds subtle shadow
                        shape: const RoundedRectangleBorder(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        color: Color.lerp(const Color(0xffc1b9fb), Colors.greenAccent, 0.7), // Background color
                        child: SizedBox(
                          height: height * 0.3,
                          width: width * 0.4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.035, vertical: height * 0.05),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconContainer(
                                  iconString: 'assets/icons/mic.png',
                                  quaterTurns: 4,
                                  color: Color.fromARGB(228, 214, 214, 214),
                                ),
                                Text(
                                  'Talk',
                                  style: TextStyle(color: Colors.black, fontSize: 30, fontFamily: 'Josefin Sans'),
                                ),
                                Text(
                                  'With',
                                  style: TextStyle(color: Colors.black, fontSize: 30, fontFamily: 'Josefin Sans'),
                                ),
                                Text(
                                  'Buddy',
                                  style: TextStyle(color: Colors.black, fontSize: 30, fontFamily: 'Josefin Sans'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(const ChatScreen()),
                            child: Container(
                              height: height * 0.14,
                              width: width * 0.5,
                              decoration: const BoxDecoration(
                                color: Color(0xff8a33fa),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(60),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const IconContainer(
                                      iconString: 'assets/icons/send.png',
                                      quaterTurns: 4,
                                      color: Color.fromARGB(135, 214, 214, 214),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    const Text(
                                      'Chat with Buddy',
                                      style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: 'Josefin Sans'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.015),
                          Container(
                            height: height * 0.14,
                            width: width * 0.5,
                            decoration: const BoxDecoration(
                              color: Color(0xff42c1f3),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(60),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const IconContainer(
                                    iconString: 'assets/icons/qrcode.png',
                                    quaterTurns: 4,
                                    color: Color.fromARGB(135, 214, 214, 214),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  const Text(
                                    'Search by Image',
                                    style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: 'Josefin Sans'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.023, horizontal: width * 0.02),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Search',
                          style: TextStyle(fontSize: 28, color: Colors.white70, fontFamily: 'Josefin Sans'),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(fontSize: 28, color: Colors.white70, fontFamily: 'Josefin Sans'),
                        ),
                      ],
                    ),
                  ),
                  const RecentChatTile(
                    title: 'Reccomendation for Chat UI/UX',
                  ),
                  SizedBox(height: height * 0.01),
                  const RecentChatTile(
                    title: 'Reccomendation for Chat UI/UX',
                  ),
                  SizedBox(height: height * 0.01),
                  const RecentChatTile(
                    title: 'Reccomendation for Chat UI/UX',
                  ),
                  SizedBox(height: height * 0.01),
                  const RecentChatTile(
                    title: 'Reccomendation for Chat UI/UX',
                  ),
                  SizedBox(height: height * 0.01),
                  const RecentChatTile(
                    title: 'Reccomendation for Chat UI/UX',
                  ),
                  SizedBox(height: height * 0.01),
                  const RecentChatTile(
                    title: 'Reccomendation for Chat UI/UX',
                  ),
                  SizedBox(height: height * 0.01),
                  const RecentChatTile(
                    title: 'Reccomendation for Chat UI/UX',
                  ),
                  SizedBox(height: height * 0.01),
                  const RecentChatTile(
                    title: 'Reccomendation for Chat UI/UX',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
