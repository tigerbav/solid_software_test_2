import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class ImageAppProvider {
  static Future<File?> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return null;

    return File(image.path);
  }

  static Future<double?> compareImages(
    File? firstFile,
    File? secondFile,
  ) async {
    if (firstFile == null || secondFile == null) return null;

    final firstImage = await _getImageBytes(firstFile);
    final secondImage = await _getImageBytes(secondFile);

    if (firstImage == null || secondImage == null) return null;

    final length = min(
      firstImage.buffer.lengthInBytes,
      secondImage.buffer.lengthInBytes,
    );
    var equalElements = 0;

    final firstBuffer = firstImage.buffer.asUint8List();
    final secondBuffer = secondImage.buffer.asUint8List();

    for (var i = 0; i < length; i++) {
      if (firstBuffer[i] == secondBuffer[i]) equalElements++;
    }

    return equalElements / length * 100;
  }

  static Future<img.Image?> _getImageBytes(File file) async {
    final byteData = await rootBundle.load(file.path);
    return img.decodeImage(Uint8List.fromList(byteData.buffer.asUint8List()));
  }
}
