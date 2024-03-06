import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/logic/choose_image_cubit.dart';
import 'package:solid_software_test/generated/locale_keys.g.dart';

class PercentWidget extends StatelessWidget {
  const PercentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseImageCubit, ChooseImageState>(
      buildWhen: (p, c) => p.comparePercent != c.comparePercent,
      builder: (context, state) {
        if (state.comparePercent == null) return const SizedBox(height: 20);

        return Text(
          '${state.comparePercent!.toStringAsFixed(2)}${LocaleKeys.similarity.tr()}',
        );
      },
    );
  }
}
