class ApiResponse<T> {
  final bool success;
  final T data;
  final String message;
  final int statusCode;
  final List<String> errors;

  ApiResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.statusCode,
    required this.errors,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'] ?? false,
      data: fromJsonT(json['data']),
      message: json['message'] ?? '',
      statusCode: json['status_code'] ?? 0,
      errors: List<String>.from(json['errors'] ?? []),
    );
  }
}
