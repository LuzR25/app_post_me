import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'actualizacion_event.dart';
part 'actualizacion_state.dart';

class ActualizacionBloc extends Bloc<ActualizacionEvent, ActualizacionState> {
  
  ActualizacionBloc() : super(const ActualizacionState(
    nuevaModificacion: false, 
    nuevaPublicacion: false)) {
    on<NuevaModificacionEvent>((event, emit) => emit(state.copyWith(
      nuevaModificacion: event.nuevaModificacion
    )));

    on<NuevaPublicacionEvent>((event, emit) => emit(state.copyWith(
      nuevaPublicacion: event.nuevaPublicacion
    )));
  }
  
  ///Añade un evento de tipo NuevaModificacionEvent que toma de valor el
  ///parámetro pasado.
  void seModificoUsuario(bool seModifico) {
    add(NuevaModificacionEvent(nuevaModificacion: seModifico));
  }

  ///Añade un evento de tipo NuevaPublicacionEvent que toma de valor el
  ///parámetro pasado.
  void seCreoPublicacion(bool seCreo) {
    add(NuevaPublicacionEvent(nuevaPublicacion: seCreo));
  }
}
