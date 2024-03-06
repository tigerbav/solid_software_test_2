import 'package:flutter/material.dart';
import 'package:solid_software_test/common/app_colors.dart';

/// primary button for app
class PrimaryButton extends StatelessWidget {
  /// constructor
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.shared.green,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: SizedBox(
          height: 30,
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(title, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
