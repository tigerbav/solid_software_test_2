// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "please_select_first_image": "Please, select first image.",
  "please_select_second_image": "Please, select second image.",
  "something_went_wrong": "Something went wrong.",
  "first_image": "First image",
  "second_image": "Second image",
  "calculate": "Calculate",
  "open_gallery": "Open gallery",
  "use_camera": "Use camera",
  "similarity": "% similarity"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US};
}
