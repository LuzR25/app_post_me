
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Themes/app_themes.dart';
import '../Widgets/widgets.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({super.key});

  @override
  State<InicioWidget> createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppThemes.paddingInicio),
      children: [
        TarjetaPublicacionWidget(nombreUsuario: 'acuablast', fechaPublicacion: "10 de abril de 2024", descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'meleatwygrey', fechaPublicacion: "10 de abril de 2024", descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'luciernaga', fechaPublicacion: "10 de abril de 2024", descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'angel', fechaPublicacion: "10 de abril de 2024", descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'luzr', fechaPublicacion: "10 de abril de 2024", descripcion: 'Probando.', imagen: 'assets/images/vaca.png'),
        SizedBox(height: 3.h),
        TarjetaPublicacionWidget(nombreUsuario: 'persona123', fechaPublicacion: "10 de abril de 2024", descripcion: 'Probando.', imagen: 'assets/images/vaca.png')
      ],
    );
  }
}