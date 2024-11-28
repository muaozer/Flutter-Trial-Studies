import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/sepet.dart';

class SepetRepo {
  final String baseUrl = "http://kasimadalan.pe.hu/yemekler";

  Future<List<Sepet>> getSepetItems() async {
    final url = Uri.parse("$baseUrl/sepettekiYemekleriGetir.php");
    final response = await http.post(url, body: {
      "kullanici_adi": "ogrenci_adi"
    });

    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        if (data["success"] == 1) {
          final List sepetList = data["sepet_yemekler"];
          return sepetList.map((json) => Sepet.fromJson(json)).toList();
        }
      } catch (e) {
        // JSON çözümleme hatası durumunda boş sepet döndür
        return [];
      }
      return [];
    }
    throw Exception("Sepet yükleme hatası");
  }

  Future<void> addToSepet(String yemekAdi, String yemekResimAdi, int yemekFiyat, int yemekSiparisAdet, String kullaniciAdi) async {
    final url = Uri.parse("$baseUrl/sepeteYemekEkle.php");
    final response = await http.post(url, body: {
      "yemek_adi": yemekAdi,
      "yemek_resim_adi": yemekResimAdi,
      "yemek_fiyat": yemekFiyat.toString(),
      "yemek_siparis_adet": yemekSiparisAdet.toString(),
      "kullanici_adi": kullaniciAdi
    });

    if (response.statusCode != 200) {
      throw Exception("Sepete ekleme hatası");
    }
  }

  Future<void> removeFromSepet(String sepetYemekId, String kullaniciAdi) async {
    final url = Uri.parse("$baseUrl/sepettenYemekSil.php");
    final response = await http.post(url, body: {
      "sepet_yemek_id": sepetYemekId,
      "kullanici_adi": kullaniciAdi
    });

    if (response.statusCode != 200) {
      throw Exception("Sepetten silme hatası");
    }
  }
}
