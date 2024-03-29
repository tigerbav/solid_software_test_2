import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solid_software_test/common/app_colors.dart';
import 'package:solid_software_test/generated/locale_keys.g.dart';

/// class of extra options for UI
class Utils {
  /// open dialog foreground
  static Future<dynamic> openDialog(
    BuildContext context,
    Widget child,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => child,
    );
  }

  /// show snack bar
  static void showSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.shared.red,
        content: Text(
          message ?? LocaleKeys.something_went_wrong.tr(),
        ),
      ),
    );
  }
}
