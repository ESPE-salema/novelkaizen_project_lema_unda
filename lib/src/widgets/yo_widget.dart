import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:novelkaizen_project_lema_unda/src/providers/main_provider.dart';
import 'package:novelkaizen_project_lema_unda/src/widgets/setting_widget.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';

class YoWidget extends StatelessWidget {
  const YoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    Map<String, dynamic> content = JwtDecoder.decode(mainProvider.token);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
                elevation: 2.0,
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(content["name"] ?? ""),
                  subtitle: const Text("Nombre de usuario"),
                  trailing: IconButton(
                      tooltip: "Cerrar Sesión",
                      onPressed: () {
                        mainProvider.token = "";
                        Restart.restartApp(webOrigin: '/login');
                      },
                      icon: const Icon(Icons.logout)),
                )),
            Expanded(
                child: ListView(
              children: const <Widget>[
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
