class Publicacion {
  int idPublicacion;
  String? descripcion;
  String foto;
  int idUsuario;
  String nombreUsuario;
  String fotoPerfil;
  String fecha;

  Publicacion(
      {required this.idPublicacion,
      required this.idUsuario,
      required this.fotoPerfil,
      required this.nombreUsuario,
      required this.fecha,
      required this.foto,
      this.descripcion});

  factory Publicacion.fromJson(Map<String, dynamic> json) => Publicacion(
    idPublicacion: json["numPublicacion"],
    idUsuario: json["idUsuario"],
    fotoPerfil: json["fotoPerfil"], 
    nombreUsuario: json["nombreCuenta"],
    fecha: json["fecha"], 
    foto: json["foto"],
    descripcion: json["descripcion"]
  );

  Map<String, dynamic> toJson() => {
        "numPublicacion": idPublicacion,
        "foto": foto,
        "idUsuario": idUsuario,
        "descripcion": descripcion,
        "nombreCuenta": nombreUsuario,
        "fotoPerfil": fotoPerfil,
        "fecha": fecha
      };

  @override
  String toString() {
    return 'idPublicacion: $idPublicacion, idUsuario: $idUsuario, descripcion: $descripcion, foto: $foto';
  }
}
