class PaginationResponse<T> {
  final List<T> data;
  final double totalPayRate;
  final int totalCount;
  final int perPage;
  final int currentPage;

  PaginationResponse({
    required this.data,
    required this.totalPayRate,
    required this.totalCount,
    required this.perPage,
    required this.currentPage,
  });

  factory PaginationResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT,
      ) {
    return PaginationResponse<T>(
      data: (json['data'] as List<dynamic>)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      totalPayRate: (json['total_pay_rate'] ?? 0).toDouble(),
      totalCount: json['total_count'] ?? 0,
      perPage: json['per_page'] ?? 10,
      currentPage: json['current_page'] ?? 1,
    );
  }
}

class UnattendedPaginationResponse<T> {
  final List<T> data;
  final int totalCount;
  final int perPage;
  final int currentPage;

  UnattendedPaginationResponse({
    required this.data,
    required this.totalCount,
    required this.perPage,
    required this.currentPage,
  });

  factory UnattendedPaginationResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT,
      ) {
    return UnattendedPaginationResponse<T>(
      data: (json['data'] as List<dynamic>)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      totalCount: json['total_count'] ?? 0,
      perPage: json['per_page'] ?? 10,
      currentPage: json['current_page'] ?? 1,
    );
  }
}