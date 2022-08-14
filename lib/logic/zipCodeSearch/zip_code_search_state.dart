import 'package:equatable/equatable.dart';

class ZipCodeSearchState extends Equatable {
  const ZipCodeSearchState({
    required this.isInitial,
    required this.isLoading,
    required this.zip,
    required this.error,
  });

  factory ZipCodeSearchState.initial() => const ZipCodeSearchState(
        isInitial: true,
        isLoading: false,
        zip: '',
        error: ErrorType.none,
      );

  factory ZipCodeSearchState.loading() => const ZipCodeSearchState(
        isInitial: false,
        isLoading: true,
        zip: '',
        error: ErrorType.none,
      );

  factory ZipCodeSearchState.fetched(
    String zip,
  ) =>
      ZipCodeSearchState(
        isInitial: false,
        isLoading: false,
        zip: zip,
        error: ErrorType.none,
      );

  factory ZipCodeSearchState.error(
    ErrorType error,
    String zip,
  ) =>
      ZipCodeSearchState(
        isInitial: false,
        isLoading: false,
        zip: zip,
        error: error,
      );

  final bool isInitial;
  final bool isLoading;
  final String zip;
  final ErrorType error;

  @override
  List<Object> get props => [
        isInitial,
        isLoading,
        zip,
        error,
      ];
}

enum ErrorType { none, invalidZip }
