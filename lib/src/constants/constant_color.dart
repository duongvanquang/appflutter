import 'package:flutter/material.dart';

class AppColor {
  static const backgroundColor = Color(0xFFFEFEFE);
  static const titleTextColor = Color(0xFF303030);
  static const gradientRightColor = Color(0xFF17F2CB);
  static const gradientLeftColor = Color(0xFF44A5B0);
  static const falseColor = Color(0xFFC13016);
  static const trueColor = Color(0xFF36C12C);
  static const primaryColor = Color(0xff007EF4);
  static const shadowColor = Color(0xFFB7B7B7);
  static const double defaultPadding = 20.0;
}

class WelcomeSreen {
  static const backgroundColor = Color(0xFFFEFEFE);
  static const titleTextColor = Color(0xFF303030);
  static const backgroundGradien = LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

class QuizSreen {
  static const backgroundColor = Color(0xFFFEFEFE);
  static const shadowColor = Color(0xFFB7B7B7);
  static const titleTextColor = Color(0xFF303030);
  static const trueColor = Color(0xFF36C12C);
  static const falseColor = Color(0xFFC13016);
}

class ScoreSreen {
  static const shadowColor = Color(0xFFB7B7B7);
}
