
//import 'dart:async';

import 'dart:async';

import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Providers/providers.dart';
import '../Widgets/widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    /* Timer(const Duration(milliseconds: 1), () {
      setState(() {});
    }); */

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
    //final registroProvider = Provider.of<RegistroProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            //Contenedor en el que se agrega la imagen del logo de la empresa
            /* Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 4.5.h, horizontal: 10.w),
              child: Image.asset(
                'assets/images/logo.png',
                height: 20.h,
              ),
            ), */

            //Nombre de la app
            Text(
              'Post Me!',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            //Se crea una tarjeta centrada para que muestre el login
            //Esta tarjeta se puede sobreponer sobre el logo
            Center(
              child: Card(
                margin: EdgeInsets.only(
                  left: 5.3.w,
                  right: 5.3.w,
                  top: 3.h,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Usuario
                      Text(
                        'Escribe tu nombre de usuario',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.7.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3.h),
                      _userTextFormField(
                          enabledBorder: enabledBorder,
                          focusedBorder: focusedBorder,
                          errorBorder: errorBorder,
                          focusedErrorBorder: focusedErrorBorder),

                      SizedBox(height: 5.h),

                      //Contraseña
                      Text(
                        'Escribe tu contraseña',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.7.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3.h),
                      _passwordTextFormField(
                          enabledBorder: enabledBorder,
                          focusedBorder: focusedBorder,
                          errorBorder: errorBorder,
                          focusedErrorBorder: focusedErrorBorder),
                      SizedBox(height: 3.h),
                      _iniciarSesionBoton(/* registroProvider */),
                    ],
                  ),
                ),
              ),
            ),

            Center(
              child: Column(
                        children: [
                          Text(
                            '¿Aún no eres usuario? Regístrate ',
                            style: TextStyle( fontSize: 16.sp ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'registro');
                            }, 
                            child: Text(
                              'aquí', 
                              style: TextStyle(
                                fontSize: 16.sp, 
                                fontWeight: FontWeight.bold),
                            )
                          )
                        ],
                      ),
            )
          ],
        ),
      ),
    );
  }

  TextButton _iniciarSesionBoton(/* RegistroProvider registroProvider */) {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 11.w)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)))),
          backgroundColor: const MaterialStatePropertyAll(AppThemes.headerBackground)),
      onPressed: () async {
        if (userController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          _ponerRuedaCargando(); //Mostramos rueda de carga

          Timer(const Duration(seconds: 2), () { });

          //* Manejo del acceso a la cuenta consumiento la API
          bool iniciaSesion = true;
          /* dynamic iniciaSesion = await LoginController()
              .iniciarSesion(
                  email: userController.text, password: passwordController.text)
              .then((value) async {
            if (value == true) {
              await HistorialChecksController()
                  .mostrarRegistros(registroProvider);
              Preferences.esSalida = _esSalida(registroProvider);
              Preferences.fechaUltRegist =
                  DateFormat("dd-MM-yyyy").format(DateTime.now());
              registroProvider.cargandoRegistros = false;
            }

            return value;
          }); */
          Navigator.of(context).pop(); //Quitamos rueda de carga

          if (iniciaSesion == true) {
            Navigator.pushReplacementNamed(context, 'navegacion_app');
          } else if (iniciaSesion == false) {
            //RegistroProvider().mostrarToast('Revisa tu conexión a internet');
          }
          setState(() {});
        } else {
          PublicacionProvider().mostrarToast(
              'Los campos para tu usuario y contraseña no pueden estar vacíos');
        }
      },
      child: Text(
        'Inicio',
        style: TextStyle(color: Colors.white, fontSize: 13.sp),
      ),
    );
  }

  TextFormField _passwordTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        suffixIcon: IconButton(
          icon: hidePassword
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                )
              : const Icon(
                  Icons.visibility_outlined,
                  color: Colors.grey,
                ),
          onPressed: () {
            setState(
              () {
                hidePassword = !hidePassword;
              },
            );
          },
        ),
        fillColor: Colors.blueGrey[50],
        labelStyle: TextStyle(fontSize: 12.5.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.9.h, horizontal: 6.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
      obscureText: hidePassword,
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

  TextFormField _userTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      controller: userController,
      decoration: InputDecoration(
        labelText: 'Usuario',
        fillColor: Colors.blueGrey[50],
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
          return 'Escribe tu usuario';
        } else {
          return null;
        }
      },
    );
  }

  void _ponerRuedaCargando() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const RuedaCargaWidget();
      },
    );
  }

  ///Calcula cuántos de los registros del usuario son de hoy, y dependiendo de
  ///si esa cantidad es impar o par, regresa un booleano que indica si el
  ///registro siguiente es una salida o una entrada.
  /* bool _esSalida(RegistroProvider registroProvider) {
    int cantRegHoy = 0;
    String fechaHoy = registroProvider.darFormatoFecha(DateTime.now());

    //Por cada registro en registros de RegistroProvider
    for (var registro in registroProvider.registros) {
      String fechaRegistro =
          registroProvider.darFormatoFecha(registro.dateTime);

      //¿Es este registro de hoy?
      if (registroProvider.esMismaFecha(fechaHoy, fechaRegistro)) {
        //Lo es
        cantRegHoy++;
      } else {
        //No es
        break;
      }
    }

    //Si la cantidad de registros es impar, entonces el último registro fue una entrada,
    //por lo que el siguiente es, a fuerzas, una salida
    return cantRegHoy.isOdd;
  } */
}
