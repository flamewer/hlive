class ApiResponse<T> {
  final int code;
  final String msg;
  final T? data;
  final String traceId;

  ApiResponse({
    required this.code,
    required this.msg,
    required this.data,
    required this.traceId,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse<T>(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] == null ? null : fromJsonT(json['data']),
      traceId: json['traceId'] as String,
    );
  }

  bool get isSuccess => code == 0 && data != null;
}
