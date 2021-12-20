import 'package:flutter/material.dart';
import 'package:novelkaizen_project_lema_unda/src/models/novela_model.dart';

class NovelaWidget extends StatelessWidget {
  const NovelaWidget({Key? key, required this.model}) : super(key: key);

  final Novela model;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading:
          CircleAvatar(backgroundImage: NetworkImage(model.portada.toString())),
      title: Text(model.titulo ?? ""),
      subtitle: Text("Autor: " +
          model.autor.toString() +
          "\n\nDescripción: " +
          model.descripcion.toString()),
      trailing: IconButton(
        icon: const Icon(Icons.check_circle),
        color: (model.favorito == true) ? Colors.green : Colors.red,
        tooltip: model.favorito.toString(),
        onPressed: () {},
      ),
    ));
  }
}
