class Publicacion {
  int? idPublicacion;
  String? descripcion;
  String foto;
  int idUsuario;

  Publicacion(
      {this.idPublicacion,
      required this.foto,
      required this.idUsuario,
      this.descripcion});

  factory Publicacion.fromJson(Map<String, dynamic> json) => Publicacion(
    idPublicacion: json["numPublicacion"],
    foto: json["foto"],
    idUsuario: json["idUsuario"],
    descripcion: json["descripcion"]

  );

  Map<String, dynamic> toJson() => {
        "foto": foto,
        "idUsuario": idUsuario,
        "descripcion": descripcion
      };

  @override
  String toString() {
    return 'idPublicacion: $idPublicacion, idUsuario: $idUsuario, descripcion: $descripcion, foto: $foto';
  }
}
