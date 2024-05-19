class Usuario {
  int idUsuario;
  String nombreUsuario;
  String nombrePerfil;
  String fotoPerfil;

  Usuario({
    required this.idUsuario,
    required this.nombreUsuario,
    required this.nombrePerfil, 
    required this.fotoPerfil
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    idUsuario: json["idUsuario"], 
    nombreUsuario: json["nombreCuenta"], 
    nombrePerfil: json["nombreUsuario"], 
    fotoPerfil: json["fotoPerfil"]
  );

  Map<String, dynamic> toJson() => {
    "idUsuario": idUsuario,
    "nombreCuenta": nombreUsuario,
    "nombreUsuario": nombrePerfil,
    "fotoPerifl": fotoPerfil
  };
}