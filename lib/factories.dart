import 'package:ata/models/auth.dart';
import 'package:ata/models/ip_info.dart';
import 'package:ata/models/office.dart';

/// Add factory functions for every Type and every constructor you want to make available to `make`
final factories = <Type, Function>{
  IpInfo: (Map<String, dynamic> x) => IpInfo.fromJson(x),
  Auth: (Map<String, dynamic> x) => Auth.fromJson(x),
  Office: (Map<String, dynamic> x) => Office.fromJson(x),
};

T make<T>(Map<String, dynamic> x) {
  return factories[T](x);
}
