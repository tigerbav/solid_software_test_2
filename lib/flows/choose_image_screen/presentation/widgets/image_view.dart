import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solid_software_test/common/app_colors.dart';
import 'package:solid_software_test/common/utils/utils.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/enums/image_type.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/logic/choose_image_cubit.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/widgets/image_resource_dialog.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    const types = ImageType.values;
    final height =
        (MediaQuery.of(context).size.width - _distance * (types.length + 1)) /
            types.length;

    final widgets = List.generate(
      types.length * 2 - 1,
      (index) {
        if (index % 2 == 0) {
          return Expanded(
            child: _Item(
              imageType: types[index ~/ 2],
              height: height,
            ),
          );
        } //
        else {
          return const SizedBox(width: _distance);
        }
      },
    );
    return Row(children: widgets);
  }

  static const _distance = 20.0;
}

class _Item extends StatelessWidget {
  const _Item({
    required this.imageType,
    required this.height,
  });

  final ImageType imageType;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseImageCubit, ChooseImageState>(
      buildWhen: (p, c) =>
          p.firstImage != c.firstImage || p.secondImage != c.secondImage,
      builder: (context, state) {
        final image = imageType.image(context);
        final cubit = context.read<ChooseImageCubit>();

        return Column(
          children: [
            GestureDetector(
              onTap: () async {
                final result = await Utils.openDialog(
                  context,
                  const ImageResourceDialog(),
                );
                if (result == null || result is! ImageSource) return;
                imageType.setImage(cubit, result);
              },
              child: Container(
                height: height,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: AppColors.shared.grey),
                ),
                child: image == null
                    ? Icon(
                        Icons.image,
                        color: AppColors.shared.grey,
                        size: 40,
                      )
                    : Image.file(image),
              ),
            ),
            const SizedBox(height: 10),
            Text(imageType.title),
          ],
        );
      },
    );
  }
}

// Widget build(BuildContext context) {
//   const types = ImageType.values;
//   final size =
//       (MediaQuery.of(context).size.width - _distance * (types.length + 1)) /
//           types.length;
//
//   return SizedBox(
//     height: size + 30,
//     child: ListView.separated(
//       itemCount: types.length,
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       separatorBuilder: (_, __) => const SizedBox(width: _distance),
//       itemBuilder: (context, index) {
//         return _Item(
//           title: types[index].title,
//           image: types[index].image(context),
//           size: size,
//         );
//       },
//     ),
//   );
// }
//
