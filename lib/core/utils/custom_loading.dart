import 'package:flutter/material.dart';

class CustomLoadingWidge extends StatelessWidget {
  const CustomLoadingWidge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
