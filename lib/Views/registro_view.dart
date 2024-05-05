import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({super.key});

  @override
  State<RegistroView> createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  var nombrePerfilController = TextEditingController();
  var nombreUsuarioController = TextEditingController();
  var passwordController = TextEditingController();
  var repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    );
    OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    );
    OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(255, 192, 36, 36)),
      borderRadius: BorderRadius.circular(10),
    );
    OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(255, 192, 36, 36)),
      borderRadius: BorderRadius.circular(10),
    );

    //! Luego checar si el column no causa problemas de visualización a la hora empezar a escribir
    //! De ser así, puedo intetar algo con Stack, similar a lo que hay en el login
    return Padding(
      //Debo checar bien este dato para asegurarse de que todas las vistas de la aplicación tengan ese padding
      padding: EdgeInsets.all(5.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Foto de perfil
              CircleAvatar(
                backgroundImage:
                    const AssetImage("assets/images/vaca.png"), //A ver si esto funciona
                radius: 5.h,
              ),

              _botonSeleccionarFoto()
            ],
          ),

          //Campo 'Nombre del perfil'
          encabezadoTextField('Nombre del perfil'),
          SizedBox(height: 3.h),
          _nombrePerfilTextFormField(
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder),

          SizedBox(height: 5.h),

          //Campo 'Nombre de usuario'
          encabezadoTextField('Nombre de usuario'),
          SizedBox(height: 3.h),
          _nombreUsuarioTextFormField(
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder),

          SizedBox(height: 5.h),

          //Campo 'Contraseña'
          encabezadoTextField('Contraseña'),
          SizedBox(height: 3.h),
          _passwordTextFormField(
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder),

          SizedBox(height: 5.h),

          //Campo 'Confirmar contraseña'
          encabezadoTextField('Confirmar contraseña'),
          SizedBox(height: 3.h),
          _repasswordTextFormField(
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder),

          SizedBox(height: 10.h),

          _botonRegistrar()
        ],
      ),
    );
  }

  Text encabezadoTextField(String textoEncabezado) {
    return Text(
      textoEncabezado,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.7.sp),
      textAlign: TextAlign.center,
    );
  }

  TextButton _botonSeleccionarFoto() {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 11.w)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
          backgroundColor:
              const MaterialStatePropertyAll(AppThemes.botonBackground)),
      child: Text(
        'Seleccionar foto',
        style: TextStyle(
            fontSize: AppThemes.botonFontSize, fontWeight: FontWeight.bold),
      ),
      onPressed: () {},
    );
  }

  TextButton _botonRegistrar() {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 11.w)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
          backgroundColor:
              const MaterialStatePropertyAll(AppThemes.botonBackground)),
      child: Text(
        'Registrar',
        style: TextStyle(
            fontSize: AppThemes.botonFontSize, fontWeight: FontWeight.bold),
      ),
      onPressed: () {},
    );
  }

  _nombrePerfilTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      controller: nombrePerfilController,
      decoration: InputDecoration(
        labelText: 'Nombre del perfil',
        fillColor: Colors.white,
        labelStyle: TextStyle(fontSize: 12.5.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.9.h, horizontal: 6.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Escribe el nombre de tu perfil';
        } else {
          return null;
        }
      },
    );
  }

  _nombreUsuarioTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      controller: nombreUsuarioController,
      decoration: InputDecoration(
        labelText: 'Nombre de usuario',
        fillColor: Colors.white,
        labelStyle: TextStyle(fontSize: 12.5.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.9.h, horizontal: 6.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Escribe el nombre de usuario';
        } else {
          return null;
        }
      },
    );
  }

  _passwordTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        fillColor: Colors.white,
        labelStyle: TextStyle(fontSize: 12.5.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.9.h, horizontal: 6.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Escribe tu contraseña';
        } else {
          return null;
        }
      },
    );
  }

  _repasswordTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      controller: repasswordController,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        fillColor: Colors.white,
        labelStyle: TextStyle(fontSize: 12.5.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.9.h, horizontal: 6.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Escribe el nombre de tu perfil';
        } else if (value != passwordController.text) {
          //! Checar que esto funcione
          return 'Las contraseñas no coinciden';
        } else {
          return null;
        }
      },
    );
  }
}
