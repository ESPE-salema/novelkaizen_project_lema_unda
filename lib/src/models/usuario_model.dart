import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.id,
    this.usuario,
    this.email,
    this.password,
  });

  int? id;
  String? usuario;
  String? email;
  String? password;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["usuario"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "email": email,
        "password": password,
      };
}
