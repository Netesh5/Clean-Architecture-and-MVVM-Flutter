//to map responses to non nullable object(model)
//data layer to domain layer
import 'package:cleanarchmvvm/application/extension.dart';
import 'package:cleanarchmvvm/data/responses/response.dart';
import 'package:cleanarchmvvm/domain/model.dart';

const String empty = "";
const int zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(this?.id?.orEmpty() ?? empty, this?.name.orEmpty() ?? empty,
        this?.notification?.orZero() ?? zero);
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.email?.orEmpty() ?? empty, this?.phone?.orEmpty() ?? empty);
  }
}
