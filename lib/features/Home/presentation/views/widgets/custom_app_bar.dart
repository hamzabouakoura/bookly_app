import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.leadingWidget,
    required this.trealingWidget,
  });

  final Widget leadingWidget;
  final Widget trealingWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [leadingWidget, trealingWidget],
      ),
    );
  }
}
