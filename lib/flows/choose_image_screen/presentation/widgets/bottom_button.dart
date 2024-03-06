import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test/common/widgets/primary_button.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/logic/choose_image_cubit.dart';
import 'package:solid_software_test/generated/locale_keys.g.dart';

/// define widget for [Scaffold.bottomNavigationBar]
class BottomButton extends StatelessWidget {
  /// constructor
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseImageCubit, ChooseImageState>(
      buildWhen: (p, c) => p.isLoading != c.isLoading,
      builder: (context, state) {
        return SafeArea(
          child: PrimaryButton(
            title: LocaleKeys.calculate.tr(),
            onTap: context.read<ChooseImageCubit>().calculate,
            isLoading: state.isLoading,
          ),
        );
      },
    );
  }
}
