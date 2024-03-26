import 'package:flutter/material.dart';

abstract class Styles {
  static const mediumStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const largeStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w400,
  );
  static const boldStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const semiboldStyle = TextStyle(
    fontWeight: FontWeight.w600,
  );
  static const subtitleStyle = TextStyle(color: Colors.grey);
}
