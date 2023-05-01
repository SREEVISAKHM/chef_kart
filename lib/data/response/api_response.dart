import 'package:chef_kart/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse({
    this.status,
    this.data,
    this.message,
  });

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.compleated(this.data) : status = Status.compleated;
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
