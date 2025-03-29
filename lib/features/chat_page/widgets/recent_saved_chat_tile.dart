import 'package:flutter/material.dart';

class RecentSavedChatTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const RecentSavedChatTile({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.055,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey,
        child: Card(
          color: const Color.fromARGB(61, 158, 158, 158),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
