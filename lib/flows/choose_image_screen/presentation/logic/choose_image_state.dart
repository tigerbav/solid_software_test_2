part of 'choose_image_cubit.dart';

/// [ChooseImageState] can be in different status, which depends on actions
enum ChooseImageStatus { initial, loading, success, failure, idle }

/// State for [ChooseImageCubit]
class ChooseImageState extends Equatable {
  /// constructor
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

  /// easiest way to compare states in other places
  bool get isLoading => status == ChooseImageStatus.loading;

  /// this method should be called if it needs to change [ChooseImageState].
  /// Don't use it, if it needs to set null
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
