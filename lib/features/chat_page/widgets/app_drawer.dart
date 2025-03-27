import 'package:aibuddy/features/chat_page/widgets/recent_saved_chat_tile.dart';
import 'package:aibuddy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height,
      width: width * 0.8,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.1, left: width * 0.02, right: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white),
                fillColor: const Color.fromARGB(45, 158, 158, 158),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                prefixIcon: SvgPicture.asset(
                  Assets.svgs.searchIcon,
                  color: Colors.white,
                  height: 20,
                  width: 20,
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 40,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) => const RecentSavedChatTile(title: 'Your Recent Messages')),
            )
          ],
        ),
      ),
    );
  }
}
