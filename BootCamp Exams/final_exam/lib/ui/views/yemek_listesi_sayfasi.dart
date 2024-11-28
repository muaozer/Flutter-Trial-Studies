import 'package:final_exam/ui/views/sepet_sayfasi.dart';
import 'package:final_exam/ui/views/yemek_detay_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_exam/ui/cubit/yemek_cubit.dart';
import 'package:final_exam/ui/cubit/states/yemek_state.dart';

class YemekListe extends StatefulWidget {
  const YemekListe({Key? key}) : super(key: key);

  @override
  _YemekListeState createState() => _YemekListeState();
}

class _YemekListeState extends State<YemekListe> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<YemekCubit>().loadYemekler();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YemekCubit, YemekState>(
      builder: (context, state) {
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
              "BUGÜN NE YESEM?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'SourGummy',
              ),
            ),
            centerTitle: true,
            actions: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: aramaYapiliyorMu
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            aramaYapiliyorMu = false;
                          });
                          context.read<YemekCubit>().clearSearch();
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.search, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            aramaYapiliyorMu = true;
                          });
                          context.read<YemekCubit>().loadYemekler();
                        },
                      ),
              ),
            ],
          ),
          body: _buildBody(state),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      // Ana sayfa işlemleri
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.category, color: Colors.white),
                    onPressed: () {
                      // Kategoriler işlemleri
                    },
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.orange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SepetSayfasi()),
                        );
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.white),
                    onPressed: () {
                      // Favoriler işlemleri
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      // Profil işlemleri
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(YemekState state) {
    if (state is YemekLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is YemekError) {
      return Center(child: Text('Hata: ${state.message}'));
    } else if (state is YemekLoaded) {
      final yemekler = state.yemekler;
      final gosterilecekListe = state.filtrelenmisYemekler ?? yemekler;

      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: aramaYapiliyorMu
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.1),
                              Colors.red.withOpacity(0.1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Ara...',
                            prefixIcon:
                                Icon(Icons.search, color: Colors.deepOrange),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (aramaSonucu) {
                            context
                                .read<YemekCubit>()
                                .searchYemekler(aramaSonucu);
                          },
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : Container(),
              ),
              gosterilecekListe.isEmpty
                  ? Center(child: Text("Sonuç bulunamadı"))
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: gosterilecekListe.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final yemek = gosterilecekListe[index];
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            gradient: LinearGradient(
                              colors: [Colors.orange, Colors.red],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(73),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          YemekDetay(yemek: yemek),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Hero(
                                        tag: 'yemek${yemek.yemekId}',
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(73),
                                          child: Image.network(
                                            "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemekResimAdi}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            yemek.yemekAdi,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "${yemek.yemekFiyat} ₺",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
