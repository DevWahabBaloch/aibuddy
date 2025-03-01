import 'package:flutter/material.dart';

import 'package:aibuddy/core/constants/app_colors.dart';

// ignore: must_be_immutable
class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final Color? drawerScrimColor;
  final Widget? endDrawer;
  bool? extendBody = false;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final String? restorationId;
  AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.drawerScrimColor,
    this.endDrawer,
    this.extendBody,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.restorationId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
    );
  }
}
