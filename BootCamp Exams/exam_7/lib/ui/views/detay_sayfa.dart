import 'package:exam_7/data/entity/kisiler.dart';
import 'package:exam_7/ui/cubit/detay_sayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetaySayfa extends StatelessWidget {
  final Kisiler kisi;

  const DetaySayfa({Key? key, required this.kisi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: kisi.name);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Detayı"),
        actions: [
          IconButton(
            onPressed: () {
              context
                  .read<DetaySayfaCubit>()
                  .guncelle(kisi.id, controller.text);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: "Kişi Adı"),
        ),
      ),
    );
  }
}
