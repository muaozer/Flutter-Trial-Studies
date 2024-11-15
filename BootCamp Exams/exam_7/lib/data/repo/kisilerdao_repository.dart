import 'package:exam_7/data/entity/kisiler.dart'; // Kendi model dosyanıza göre düzenleyin
import 'package:exam_7/sqlite/veritabani_yardimcisi.dart';

class KisilerDaoRepository {
  Future<void> kaydet(String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniKisi = Map<String, dynamic>();
    yeniKisi["name"] = name;
    await db.insert("rehber", yeniKisi); // "rehber" tablosuna kaydet
  }

  Future<void> guncelle(int id, String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenKisi = Map<String, dynamic>();
    guncellenenKisi["name"] = name;
    await db.update("rehber", guncellenenKisi,
        where: "id = ?", whereArgs: [id]); // "rehber" tablosunu güncelle
  }

  Future<void> sil(int id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("rehber",
        where: "id = ?", whereArgs: [id]); // "rehber" tablosundan sil
  }

  Future<List<Kisiler>> kisileriYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM rehber"); // "rehber" tablosundan verileri yükle
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(
          id: satir["id"],
          name: satir[
              "name"]); // "rehber" tablosundaki verileri Kisiler modeline dönüştür
    });
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM rehber WHERE name LIKE ?",
        ['%$aramaKelimesi%']); // "rehber" tablosunda arama yap
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(
          id: satir["id"],
          name: satir["name"]); // Arama sonuçlarını Kisiler modeline dönüştür
    });
  }

  Future<void> verileriGuncelle(Function(List<Kisiler>) guncelle) async {
    // Bu metot, verileri güncelleyerek arayüzü tazeleyecek
    List<Kisiler> kisilerListesi = await kisileriYukle();
    guncelle(kisilerListesi); // Arayüzde listeyi güncelleyin
  }
}
