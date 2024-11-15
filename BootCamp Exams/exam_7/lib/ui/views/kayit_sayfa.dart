import 'package:exam_7/ui/cubit/kayit_sayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KayitSayfa extends StatelessWidget {
  const KayitSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Kişi Adı"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<KayitSayfaCubit>().kaydet(controller.text);
                Navigator.pop(context);
              },
              child: const Text("Kaydet"),
            ),
          ],
        ),
      ),
    );
  }
}
