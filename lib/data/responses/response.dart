import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "notification")
  int? notification;
  CustomerResponse(this.id, this.name, this.notification);
  factory CustomerResponse.fromJson(Map<String, dynamic> json) {
    return _$CustomerResponseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CustomerResponseToJson(this);
  }
}

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  ContactResponse(this.phone, this.email);
  factory ContactResponse.fromJson(Map<String, dynamic> json) {
    return _$ContactResponseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ContactResponseToJson(this);
  }
}

@JsonSerializable()
class AuthResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customerResponse;
  @JsonKey(name: "contacts")
  ContactResponse? contactResponse;
  AuthResponse(this.customerResponse, this.contactResponse);

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$AuthResponseToJson(this);
  }
}
