import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solid_software_test/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: 'assets/locale',
      fallbackLocale: const Locale('en', 'US'),
      child: const App(),
    ),
  );
}
