import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:final_exam/data/entity/yemek.dart';

class YemekRepo {
  final String baseUrl = "http://kasimadalan.pe.hu/yemekler";

  Future<List<Yemek>> fetchYemekler() async {
    final url = Uri.parse("$baseUrl/tumYemekleriGetir.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["success"] == 1) {
        final List yemekList = data["yemekler"];
        return yemekList.map((json) => Yemek.fromJson(json)).toList();
      }
      return [];
    }
    throw Exception("Yemekler yüklenemedi");
  }
}