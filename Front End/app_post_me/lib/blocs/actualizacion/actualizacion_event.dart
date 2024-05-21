part of 'actualizacion_bloc.dart';

abstract class ActualizacionEvent extends Equatable {
  const ActualizacionEvent();

  @override
  List<Object> get props => [];
}

class NuevaModificacionEvent extends ActualizacionEvent {
  final bool nuevaModificacion;

  const NuevaModificacionEvent({required this.nuevaModificacion});
}

class NuevaPublicacionEvent extends ActualizacionEvent {
  final bool nuevaPublicacion;

  const NuevaPublicacionEvent({required this.nuevaPublicacion});
}
