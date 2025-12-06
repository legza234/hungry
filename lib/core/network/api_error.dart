class ApiError {
  String message;
  final int? statuescodes;

  ApiError({required this.message, this.statuescodes});

  @override
  String toString() {
    return 'error is :$message ( statuescodes  is$statuescodes)';
  }
}
