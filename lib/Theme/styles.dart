import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(AppColors.mainLightBlue),
    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    ),
  );

  static final loginButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.mainLightBlue),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    ),
  );
}

abstract class AppTextFieldStyle {
  static final textFieldStyle = InputDecoration(
    border: const OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.black26,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.mainLightBlue,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    isCollapsed: true,
  );
}

abstract class AppColors {
  static const Color mainDakrBlue = Color.fromRGBO(3, 37, 65, 1);
  static const Color mainLightBlue = Color(0xff01b4f4);
}
