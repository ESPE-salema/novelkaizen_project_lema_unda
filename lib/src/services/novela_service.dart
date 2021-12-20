import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:novelkaizen_project_lema_unda/src/models/novela_model.dart';

class NovelaService {
  NovelaService();

  Future<List<Novela>?> getNovelas() async {
    try {
      List<Novela> result = [];
      var url = Uri.parse('https://novelkaizen-backend.web.app/api/novelas');

      var response = await http.get(url);

      if (response.body.isEmpty) return result;

      List<dynamic> listResponse = json.decode(response.body);

      for (var item in listResponse) {
        var novela = Novela.fromJson(item);
        result.add(novela);
      }

      return result;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
