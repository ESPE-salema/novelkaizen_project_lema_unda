import 'package:flutter/material.dart';
import 'package:novelkaizen_project_lema_unda/src/models/novela_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/novela_details_widget.dart';

class NovelaPage extends StatelessWidget {
  const NovelaPage({Key? key, required this.novela}) : super(key: key);
  final Novela novela;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          elevation: 2,
          expandedHeight: 200.h,
          flexibleSpace: FlexibleSpaceBar(
              background: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Image.network(novela.portada ?? "",
                      alignment: Alignment.bottomLeft, fit: BoxFit.fitHeight)),
              SizedBox(
                  width: 165.h,
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: const Text("TÍTULO:"),
                            subtitle: Text(novela.titulo ?? "",
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                          ),
                          ListTile(
                            title: const Text("AUTOR:"),
                            subtitle: Text(novela.autor ?? "",
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ))),
            ],
          )),
        ),
        SliverFillRemaining(child: NovelaDetailsWidget(novela: novela))
      ],
    )));
  }
}
