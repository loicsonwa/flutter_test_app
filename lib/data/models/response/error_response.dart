/// errors : [{"code":"l_name","message":"The last name field is required."},{"code":"password","message":"The password field is required."}]

class ErrorResponse {
  List<Errors>? errors;

  ErrorResponse({
    this.errors,
  });

  ErrorResponse.fromJson(dynamic json) {
    if (json["errors"] != null) {
      errors = [];
      json["errors"].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (errors != null) {
      map["errors"] = errors!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// code : "l_name"
/// message : "The last name field is required."

class Errors {
  String? code;
  String? message;

  Errors({this.code, this.message});

  Errors.fromJson(dynamic json) {
    code = json["code"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["message"] = message;
    return map;
  }
}
