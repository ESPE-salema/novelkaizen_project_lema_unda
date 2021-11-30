import 'dart:convert';

Capitulo capituloFromJson(String str) => Capitulo.fromJson(json.decode(str));

String capituloToJson(Capitulo data) => json.encode(data.toJson());

class Capitulo {
  Capitulo({
    this.idCapitulo,
    this.tituloCapitulo,
    this.contenido,
    this.leido,
  });

  int? idCapitulo;
  String? tituloCapitulo;
  String? contenido;
  bool? leido;

  factory Capitulo.fromJson(Map<String, dynamic> json) => Capitulo(
        idCapitulo: json["id_capitulo"],
        tituloCapitulo: json["titulo_capitulo"],
        contenido: json["contenido"],
        leido: json["leido"],
      );

  Map<String, dynamic> toJson() => {
        "id_capitulo": idCapitulo,
        "titulo_capitulo": tituloCapitulo,
        "contenido": contenido,
        "leido": leido,
      };
}
