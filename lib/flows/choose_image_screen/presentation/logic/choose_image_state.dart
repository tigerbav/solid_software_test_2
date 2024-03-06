part of 'choose_image_cubit.dart';

enum ChooseImageStatus { initial, loading, success, failure, idle }

class ChooseImageState extends Equatable {
  const ChooseImageState({
    required this.status,
    this.firstImage,
    this.secondImage,
    this.comparePercent,
    this.errorMessage,
  });

  final ChooseImageStatus status;
  final File? firstImage;
  final File? secondImage;
  final double? comparePercent;
  final String? errorMessage;

  bool get isLoading => status == ChooseImageStatus.loading;

  ChooseImageState copyWith({
    required ChooseImageStatus status,
    File? firstImage,
    File? secondImage,
    double? comparePercent,
    String? errorMessage,
  }) {
    return ChooseImageState(
      status: status,
      firstImage: firstImage ?? this.firstImage,
      secondImage: secondImage ?? this.secondImage,
      comparePercent: comparePercent ?? this.comparePercent,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        firstImage,
        secondImage,
        comparePercent,
        errorMessage,
      ];
}
