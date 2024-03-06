import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test/common/utils/utils.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/logic/choose_image_cubit.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/widgets/bottom_button.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/widgets/image_view.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/widgets/percent_widget.dart';
import 'package:solid_software_test/generated/locale_keys.g.dart';

@RoutePage()
class ChooseImageScreen extends StatelessWidget {
  const ChooseImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChooseImageCubit(),
      child: const _ChooseImageScreen(),
    );
  }
}

class _ChooseImageScreen extends StatelessWidget {
  const _ChooseImageScreen();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChooseImageCubit, ChooseImageState>(
      listener: (context, state) {
        switch (state.status) {
          case ChooseImageStatus.failure:
            Utils.showSnackBar(context, state.errorMessage);
          default:
        }
      },
      child: const Scaffold(
        bottomNavigationBar: BottomButton(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageView(),
                SizedBox(height: 10),
                PercentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
