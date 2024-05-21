part of 'actualizacion_bloc.dart';

class ActualizacionState extends Equatable {
  final bool nuevaModificacion;
  final bool nuevaPublicacion;

  const ActualizacionState({
    this.nuevaModificacion = false,
    this.nuevaPublicacion = false
  });

  ActualizacionState copyWith({
    bool? nuevaModificacion,
    bool? nuevaPublicacion
  }) => ActualizacionState(
    nuevaModificacion: nuevaModificacion ?? this.nuevaModificacion,
    nuevaPublicacion: nuevaPublicacion ?? this.nuevaPublicacion);
  
  @override
  List<Object> get props => [nuevaModificacion, nuevaPublicacion];

  @override
  String toString() => '{nuevaModificacion: $nuevaModificacion, nuevaPublcacion: $nuevaPublicacion}';
}