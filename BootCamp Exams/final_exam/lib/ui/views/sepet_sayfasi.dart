import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_exam/ui/cubit/sepet_cubit.dart';
import 'package:final_exam/ui/cubit/states/sepet_state.dart';

class SepetSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          "Sepetim",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SepetCubit, SepetState>(
        builder: (context, state) {
          if (state is SepetLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SepetError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 120,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Sepetiniz Boş",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SepetLoaded) {
            final sepetItems = state.sepetItems;
            
            if (sepetItems.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 120,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Sepetiniz Boş",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }

            double toplamFiyat = sepetItems.fold(0.0, (sum, item) {
              return sum + (item.yemekFiyat * item.yemekSiparisAdet);
            });

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: sepetItems.length,
                    itemBuilder: (context, index) {
                      final yemek = sepetItems[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          leading: Image.network(
                            "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemekResimAdi}",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(yemek.yemekAdi,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "${yemek.yemekFiyat} TL x ${yemek.yemekSiparisAdet} = ${(yemek.yemekFiyat * yemek.yemekSiparisAdet).toStringAsFixed(2)} TL"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              context.read<SepetCubit>().removeFromSepet(
                                    yemek.sepetYemekId,
                                    yemek.kullaniciAdi,
                                  );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, -2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Toplam Fiyat:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${toplamFiyat.toStringAsFixed(2)} TL",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Center(
                          child: Text(
                            "Sepeti Onayla",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 120,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  "Sepetiniz Boş",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
