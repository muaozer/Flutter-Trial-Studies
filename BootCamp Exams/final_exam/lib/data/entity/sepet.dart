class Sepet {
  final String sepetYemekId;
  final String yemekAdi;
  final String yemekResimAdi;
  final int yemekFiyat;
  final int yemekSiparisAdet;
  final String kullaniciAdi;

  Sepet({
    required this.sepetYemekId,
    required this.yemekAdi,
    required this.yemekResimAdi,
    required this.yemekFiyat,
    required this.yemekSiparisAdet,
    required this.kullaniciAdi,
  });

  factory Sepet.fromJson(Map<String, dynamic> json) {
    return Sepet(
      sepetYemekId: json['sepet_yemek_id'],
      yemekAdi: json['yemek_adi'],
      yemekResimAdi: json['yemek_resim_adi'],
      yemekFiyat: int.parse(json['yemek_fiyat']),
      yemekSiparisAdet: int.parse(json['yemek_siparis_adet']),
      kullaniciAdi: json['kullanici_adi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sepet_yemek_id': sepetYemekId,
      'yemek_adi': yemekAdi,
      'yemek_resim_adi': yemekResimAdi,
      'yemek_fiyat': yemekFiyat.toString(),
      'yemek_siparis_adet': yemekSiparisAdet.toString(),
      'kullanici_adi': kullaniciAdi,
    };
  }
}