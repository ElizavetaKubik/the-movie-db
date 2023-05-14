import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static const Color color = Color(0xff01b4f4);

  static final ButtonStyle linkButton = ButtonStyle(
    // backgroundColor: MaterialStateProperty.all(color),
    foregroundColor: MaterialStateProperty.all(color),
    textStyle: MaterialStateProperty.all(
        const TextStyle(/*fontWeight: FontWeight.w700, */ fontSize: 16)),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    ),
  );
}
