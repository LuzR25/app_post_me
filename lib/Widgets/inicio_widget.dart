import 'package:app_post_me/Widgets/tarjeta_publicacion_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({super.key});

  @override
  State<InicioWidget> createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TarjetaPublicacionWidget(nombreUsuario: 'acuablast', fechaPublicacion: DateTime(2024, 4, 10), descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'meleatwygrey', fechaPublicacion: DateTime(2024, 4, 10), descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'luciernaga', fechaPublicacion: DateTime(2024, 4, 10), descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'angel', fechaPublicacion: DateTime(2024, 4, 10), descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'luzr', fechaPublicacion: DateTime(2024, 4, 10), descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'persona123', fechaPublicacion: DateTime(2024, 4, 10), descripcion: 'Probando.', imagen: 'assets/images/vaca.png')
      ],
    );
  }
}