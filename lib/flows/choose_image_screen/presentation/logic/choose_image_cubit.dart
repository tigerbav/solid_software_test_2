import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test/generated/locale_keys.g.dart';
import 'package:solid_software_test/services/image/image_app_provider.dart';

part 'choose_image_state.dart';

class ChooseImageCubit extends Cubit<ChooseImageState> {
  ChooseImageCubit()
      : super(const ChooseImageState(status: ChooseImageStatus.initial));

  void setFirstImage(File image) {
    emit(state.copyWith(
      status: ChooseImageStatus.idle,
      firstImage: image,
      comparePercent: null,
    ));
  }

  void setSecondImage(File image) {
    emit(state.copyWith(
      status: ChooseImageStatus.idle,
      secondImage: image,
      comparePercent: null,
    ));
  }

  Future<void> calculate() async {
    if (state.isLoading) return;

    if (state.firstImage == null || state.secondImage == null) {
      emit(state.copyWith(
        status: ChooseImageStatus.failure,
        errorMessage: state.firstImage == null
            ? LocaleKeys.please_select_first_image.tr()
            : LocaleKeys.please_select_second_image.tr(),
      ));
      return;
    }

    emit(state.copyWith(status: ChooseImageStatus.loading));

    //for demonstrate
    await Future.delayed(const Duration(seconds: 1));

    final result = await ImageAppProvider.compareImages(
      state.firstImage,
      state.secondImage,
    );

    if (result == null) {
      emit(state.copyWith(
        status: ChooseImageStatus.failure,
        errorMessage: LocaleKeys.something_went_wrong.tr(),
      ));
      return;
    }

    emit(state.copyWith(
      status: ChooseImageStatus.success,
      comparePercent: result,
    ));
  }
}
