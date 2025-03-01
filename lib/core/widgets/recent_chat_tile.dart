import 'package:aibuddy/core/widgets/icon_container.dart';
import 'package:flutter/material.dart';

class RecentChatTile extends StatelessWidget {
  final String title;
  const RecentChatTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.01),
      decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.5), borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: [
          Expanded(
              flex: 1, child: IconContainer(iconString: 'assets/icons/qrcode.png', quaterTurns: 4, color: Colors.greenAccent)),
          SizedBox(width: width * 0.03),
          Expanded(
            flex: 7,
            child: Text(title,
                style: const TextStyle(
                    fontSize: 20, color: Colors.white, overflow: TextOverflow.ellipsis, fontFamily: 'Josefin Sans')),
          ),
          const Expanded(
            flex: 2,
            child: Icon(Icons.more_horiz, color: Colors.white),
          )
        ],
      ),
    );
  }
}
