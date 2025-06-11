enum Status {
  success,
  failed,
}

class StatusResponse<T> {
  final Status status;
  final T? data;

  StatusResponse({required this.status, this.data});
}
