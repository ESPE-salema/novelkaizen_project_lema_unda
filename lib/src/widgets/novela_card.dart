import 'package:flutter/material.dart';
import 'package:novelkaizen_project_lema_unda/src/models/novela_model.dart';
import 'package:novelkaizen_project_lema_unda/src/pages/novela_page.dart';

class NovelaCard extends StatelessWidget {
  const NovelaCard({Key? key, required this.model}) : super(key: key);
  final Novela model;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        NovelaPage(novela: model)),
              );
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Image.network(model.portada ?? "",
                            fit: BoxFit.cover)),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          model.titulo ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                ))));
  }
}
