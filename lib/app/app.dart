import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solid_software_test/services/navigation/app_router.dart';

/// widget for setting localization properties and MaterialApp
class App extends StatelessWidget {
  /// constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().config(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
