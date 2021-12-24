import 'package:flutter/material.dart';
import 'package:novelkaizen_project_lema_unda/src/models/novela_model.dart';

class NovelaPage extends StatelessWidget {
  const NovelaPage({Key? key, required this.novela}) : super(key: key);
  final Novela novela;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: AppBar(title: Text(novela.titulo ?? ""))));
  }
}
