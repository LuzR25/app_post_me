import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConfiguracionWidget extends StatelessWidget {
  const ConfiguracionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppThemes.paddingAppGeneral), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Configuración', style: TextStyle(fontSize: AppThemes.tituloSize, fontWeight: FontWeight.bold),),

          TextButton(
            onPressed: () {}, 
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w)),
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
              backgroundColor: const MaterialStatePropertyAll(AppThemes.botonBackground)
            ),
            child: Text(
              'Modificar datos de cuenta', 
              style: TextStyle(
                fontSize: AppThemes.botonFontSize,
                //fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            )
          ),

          TextButton(
            onPressed: () {}, 
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w)),
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
              backgroundColor: const MaterialStatePropertyAll(AppThemes.botonBackground)
            ),
            child: Text(
              'Ver más en GitHub', 
              style: TextStyle(
                fontSize: AppThemes.botonFontSize,
                //fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            )
          ),

          TextButton(
            onPressed: () {}, 
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w)),
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
              backgroundColor: const MaterialStatePropertyAll(AppThemes.botonBackground)
            ),
            child: Text(
              'Acerca de', 
              style: TextStyle(
                fontSize: AppThemes.botonFontSize,
                //fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            )
          ),

          TextButton(
            onPressed: () {}, 
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w)),
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
              backgroundColor: const MaterialStatePropertyAll(AppThemes.botonBackground)
            ),
            child: Text(
              'Cerrar sesión', 
              style: TextStyle(
                fontSize: AppThemes.botonFontSize,
                //fontWeight: FontWeight.bold,
                color: Colors.red[700] //!Necesito que los botones se expandan a lo ancho
              ),
            )
          ),
        ],
      ),
    );
  }
}
