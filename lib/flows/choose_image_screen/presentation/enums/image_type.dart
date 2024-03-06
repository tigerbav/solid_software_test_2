import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/logic/choose_image_cubit.dart';
import 'package:solid_software_test/generated/locale_keys.g.dart';
import 'package:solid_software_test/services/image/image_app_provider.dart';

enum ImageType { firstImage, secondImage }

extension ImageTypeEx on ImageType {
  String get title {
    switch (this) {
      case ImageType.firstImage:
        return LocaleKeys.first_image.tr();
      case ImageType.secondImage:
        return LocaleKeys.second_image.tr();
    }
  }

  File? image(BuildContext context) {
    switch (this) {
      case ImageType.firstImage:
        return context.read<ChooseImageCubit>().state.firstImage;
      case ImageType.secondImage:
        return context.read<ChooseImageCubit>().state.secondImage;
    }
  }

  Future<void> setImage(ChooseImageCubit cubit, ImageSource imageSource) async {
    final image = await ImageAppProvider.getImage(imageSource);
    if (image == null) return;

    switch (this) {
      case ImageType.firstImage:
        return cubit.setFirstImage(image);
      case ImageType.secondImage:
        return cubit.setSecondImage(image);
    }
  }
}
