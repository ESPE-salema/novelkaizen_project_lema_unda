import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:novelkaizen_project_lema_unda/src/providers/main_provider.dart';
import 'package:provider/provider.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);

    return Column(
      children: <Widget>[
        ExpansionTile(
          leading: const Icon(Icons.settings),
          title: const Text(
            "Configuración"
          ),
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.brightness_4_outlined),
              title: const Text('Modo Oscuro'),
              trailing: Switch(
                value: !mainProvider.mode,
                onChanged: (bool value) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool("mode", !value);
                  mainProvider.mode = !value;
                },
              ),
              /*trailing: Switch(value: mainProvider.mode, onChanged: onChanged)*/
            )
          ],
        ),
      ],
    );
  }
}
