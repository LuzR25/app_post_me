class Publicacion {
  int idPublicacion;
  String? descripcion;
  String foto;
  int idUsuario;
  String nombreUsuario;
  String nombrePerfil;
  String fotoPerfil;
  String fecha;

  Publicacion(
      {required this.idPublicacion,
      required this.idUsuario,
      required this.fotoPerfil,
      required this.nombreUsuario,
      required this.nombrePerfil,
      required this.fecha,
      required this.foto,
      this.descripcion});

  factory Publicacion.fromJson(Map<String, dynamic> json) => Publicacion(
    idPublicacion: json["numPublicacion"],
    idUsuario: json["idUsuario"],
    fotoPerfil: json["fotoPerfil"], //!Cambiar al de la base de datos
    nombreUsuario: json["nombreUsuario"], //!Cambiar al de la base de datos
    nombrePerfil: json["nombrePerfil"], //!Cambiar al de la base de datos
    fecha: json["fecha"], //!Cambiar al de la base de datos
    foto: json["foto"],
    descripcion: json["descripcion"]

  );

  Map<String, dynamic> toJson() => {
        "idPublicacion": idPublicacion,
        "foto": foto,
        "idUsuario": idUsuario,
        "descripcion": descripcion,
        "nombrePerfil": nombrePerfil,
        "nombreUsuario": nombreUsuario,
        "fotoPerfil": fotoPerfil,
        "fecha": fecha
      };

  @override
  String toString() {
    return 'idPublicacion: $idPublicacion, idUsuario: $idUsuario, descripcion: $descripcion, foto: $foto';
  }
}
