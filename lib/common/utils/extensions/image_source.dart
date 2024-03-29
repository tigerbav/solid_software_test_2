import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solid_software_test/generated/locale_keys.g.dart';

/// ImageSource doesn't contain necessary titles
extension ImageSourceEx on ImageSource {
  /// get title
  String get title {
    switch (this) {
      case ImageSource.camera:
        return LocaleKeys.use_camera.tr();
      case ImageSource.gallery:
        return LocaleKeys.open_gallery.tr();
    }
  }
}
