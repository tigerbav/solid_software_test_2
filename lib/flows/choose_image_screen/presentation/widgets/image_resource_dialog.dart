import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solid_software_test/common/app_colors.dart';
import 'package:solid_software_test/common/utils/extensions/image_source.dart';

/// call this widget to define way for selection image
class ImageResourceDialog extends StatelessWidget {
  /// constructor
  const ImageResourceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.shared.green,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ImageSource.values.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) => _Item(ImageSource.values[index]),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.imageSource);

  final ImageSource imageSource;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pop(imageSource),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.shared.red,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          imageSource.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
