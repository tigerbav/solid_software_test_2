import 'package:flutter/material.dart';

/// class for colors in app
class AppColors {
  /// via this value, programmer can call object of current class
  static final shared = AppColors._();
  AppColors._();
  static final _color = LightColor();

  Color get red => _color.red;
  Color get grey => _color.grey;
  Color get black => _color.black;
  Color get green => _color.green;
}

/// announce which color can be used in app
abstract class IColors {
  late final Color red;
  late final Color grey;
  late final Color black;
  late final Color green;
}

/// define colors if current theme is light
class LightColor implements IColors {
  @override
  Color black = const Color(0xFF000000);

  @override
  Color green = const Color(0xFF6DD268);

  @override
  Color grey = const Color(0xFF848484);

  @override
  Color red = const Color(0xFFFF938E);
}
