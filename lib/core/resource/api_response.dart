
class ApiResponse<T>{
  final bool ? success;
  final String ? msg;
  final dynamic record;

  ApiResponse({this.success, this.msg, this.record});

  factory ApiResponse.fromJson(Map<String, dynamic> map) {
    return ApiResponse<T>(
      success: map['success'],
      msg: map['msg'],
      record: map.containsKey("record") ? map['record'] : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "success": this.success,
    "msg": this.msg,
    "record": this.record,
  };
}