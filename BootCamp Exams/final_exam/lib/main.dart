import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_exam/ui/cubit/yemek_cubit.dart';
import 'package:final_exam/ui/cubit/sepet_cubit.dart';
import 'package:final_exam/ui/views/yemek_listesi_sayfasi.dart';
import 'package:final_exam/data/repo/yemek_repo.dart';
import 'package:final_exam/data/repo/sepet_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => YemekCubit(YemekRepo())),
        BlocProvider(create: (_) => SepetCubit(SepetRepo())),
      ],
      child: MaterialApp(
        title: 'Yemek Sipariş Uygulaması',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: YemekListe(),
      ),
    );
  }
}
