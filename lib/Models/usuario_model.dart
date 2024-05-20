class Usuario {
  int idUsuario;
  String nombreUsuario;
  String nombrePerfil;
  String fotoPerfil;
  String password;

  Usuario({
    required this.idUsuario,
    required this.nombreUsuario,
    required this.nombrePerfil, 
    required this.password,
    required this.fotoPerfil
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    idUsuario: json["idUsuario"], 
    nombreUsuario: json["nombreCuenta"], 
    nombrePerfil: json["nombreUsuario"], 
    fotoPerfil: json["fotoPerfil"],
    password: json["contrasena"]
  );

  Map<String, dynamic> toJson() => {
    "idUsuario": idUsuario,
    "nombreCuenta": nombreUsuario,
    "nombreUsuario": nombrePerfil,
    "contrasena": password,
    "fotoPerfil": fotoPerfil
  };
}