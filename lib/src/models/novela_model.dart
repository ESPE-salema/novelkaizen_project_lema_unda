import 'dart:convert';

import 'package:novelkaizen_project_lema_unda/src/models/capitulo_model.dart';
import 'package:novelkaizen_project_lema_unda/src/models/genero_model.dart';

Novela novelaFromJson(String str) => Novela.fromJson(json.decode(str));

String novelaToJson(Novela data) => json.encode(data.toJson());

class Novela {
  Novela({
    this.id,
    this.autor,
    this.titulo,
    this.portada,
    this.descripcion,
    this.favorito,
    /*
    this.generos,
    this.capitulos,*/
  });

  String? id;
  String? autor;
  String? titulo;
  String? portada;
  String? descripcion;
  bool? favorito;
  List<Genero>? generos;
  List<Capitulo>? capitulos;

  factory Novela.fromJson(Map<String, dynamic> json) => Novela(
        id: json["id"],
        autor: json["autor"],
        titulo: json["titulo"],
        portada: json["portada"],
        descripcion: json["descripcion"],
        favorito: json["favorito"],
        /*generos:
            List<Genero>.from(json["generos"].map((x) => Genero.fromJson(x))),
        capitulos: List<Capitulo>.from(
            json["capitulos"].map((x) => Capitulo.fromJson(x))),*/
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "autor": autor,
        "titulo": titulo,
        "portada": portada,
        "descripcion": descripcion,
        "favorito": favorito,
        /*"generos": List<dynamic>.from(generos!.map((x) => x.toJson())),
        "capitulos": List<dynamic>.from(capitulos!.map((x) => x.toJson())),*/
      };
}
