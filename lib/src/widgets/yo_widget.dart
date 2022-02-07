import 'package:flutter/material.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/setting_widget.dart';

class YoWidget extends StatelessWidget {
  const YoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
              children: const <Widget>[
                Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Iniciar sesión"),
                    )),
                Card(elevation: 2.0, child: SettingWidget()),
                Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: Icon(Icons.help_outline),
                      title: Text("Comentarios y sugerencias"),
                    )),
                Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: Icon(Icons.error_outline),
                      title: Text("Sobre nosotros"),
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
