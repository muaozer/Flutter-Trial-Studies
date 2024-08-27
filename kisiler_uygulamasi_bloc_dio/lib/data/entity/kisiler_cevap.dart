import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerCevap {
  List<Kisiler> kisiler;
  int succes;
  KisilerCevap({required this.kisiler, required this.succes});

  factory KisilerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["kisiler"] as List;
    int success = json["success"] as int;

    var kisiler = jsonArray
        .map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi))
        .toList();

    return KisilerCevap(kisiler: kisiler, succes: success);
  }
}
