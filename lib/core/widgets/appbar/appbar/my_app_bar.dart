// import 'package:aibuddy/gen/assets.gen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Widget _child;
//   final double? height;

//   MyAppBar({
//     super.key,
//     required final String title,
//     this.height,
//   }) : _child = _AppBar(
//           title: title,
//           height: height,
//         );

//   MyAppBar.noBackBtn({
//     super.key,
//     required final String title,
//     this.height,
//   }) : _child = _NoBackButtonAppBar(
//           title: title,
//           height: height,
//         );

//   @override
//   Widget build(BuildContext context) {
//     return _child;
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight + 18);
// }

// class _AppBar extends StatelessWidget implements PreferredSizeWidget {
//   final double? height;
//   final String title;
//   const _AppBar({required this.title, this.height});

//   @override
//   Widget build(BuildContext context) {
//     double? height = MediaQuery.sizeOf(context).height;
//     double? width = MediaQuery.sizeOf(context).width;
//     return PreferredSize(
//       preferredSize: preferredSize,
//       child: Padding(
//         padding: EdgeInsets.only(top: height * 0.04),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: width * 0.05,
//               ),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                       onTap: () => Get.back(),
//                       child: Image.asset(Assets.icons.chevron.path, height: height * 0.03, color: Colors.white)),
//                   SizedBox(
//                     width: width * 0.3,
//                   ),
//                   Text(title, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight + 18);
// }

// class _NoBackButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final double? height;
//   final String title;
//   const _NoBackButtonAppBar({required this.title, this.height});

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//         preferredSize: preferredSize,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(title, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
//           ],
//         ));
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight + 18);
// }

import 'package:aibuddy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget _child;

  MyAppBar({
    super.key,
    required final String title,
    final VoidCallback? onTap,
  }) : _child = _AppBar(
          title: title,
          onTap: onTap,
        );

  MyAppBar.noBackBtn({
    super.key,
    required final String title,
  }) : _child = _NoBackButtonAppBar(title: title);

  @override
  Widget build(BuildContext context) {
    return _child;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const _AppBar({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return AppBar(
      leading: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset(
            Assets.images.icMenu.path,
            height: height * 0.025,
            color: Colors.white,
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      actions: [
        Image.asset(
          Assets.images.icEdit.path,
          color: Colors.white,
          height: height * 0.03,
          fit: BoxFit.contain,
        ),
        SizedBox(width: width * 0.02)
      ],
      centerTitle: true,
      backgroundColor: const Color(0xff0a1427),
      elevation: 0,
    );
  }
}

class _NoBackButtonAppBar extends StatelessWidget {
  final String title;

  const _NoBackButtonAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
