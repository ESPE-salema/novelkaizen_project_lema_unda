import 'dart:convert';

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

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "email": email,
        "password": password,
      };
}
