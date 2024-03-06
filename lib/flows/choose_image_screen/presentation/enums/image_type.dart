import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solid_software_test/flows/choose_image_screen/presentation/logic/choose_image_cubit.dart';
import 'package:solid_software_test/generated/locale_keys.g.dart';
import 'package:solid_software_test/services/image/image_app_provider.dart';

/// there are 2 images in app and programmer should work with them
enum ImageType { firstImage, secondImage }

/// [ImageType] should has extra methods
extension ImageTypeEx on ImageType {
  /// getting title
  String get title {
    switch (this) {
      case ImageType.firstImage:
        return LocaleKeys.first_image.tr();
      case ImageType.secondImage:
        return LocaleKeys.second_image.tr();
    }
  }

  /// getting images from [ChooseImageState]
  File? image(BuildContext context) {
    switch (this) {
      case ImageType.firstImage:
        return context.read<ChooseImageCubit>().state.firstImage;
      case ImageType.secondImage:
        return context.read<ChooseImageCubit>().state.secondImage;
    }
  }

  /// define methods, for setting image in [ChooseImageCubit]
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
