# Post Me!

El presente repositorio contiene él código de Post Me!, una aplicación móvil que, como una red social, permite a un usuario registrarse en la aplicación y publicar imágenes con una descripción haciendo uso de dicha cuenta y que es el proyecto final de la asignatura Sistemas Distribuidos. Lo que sigue son las especificaciones sobre diseño, arquitectura y código de la app.

## Integrantes del equipo

Las personas que colaboramos en este proyecto fuimos:

- Luz Rocío García Peña
- Angel David Ricalde Ché

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

## Objetivo del proyecto

Crear una aplicación que se llamará “Post Me!” y que permitirá la publicación de imágenes con una descripción mediante la creación y edición de una cuenta.

## Diagrama de casos de uso
<p align="center">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Diagrama%20de%20casos%20de%20uso.png">
</p>

## Requisitos funcionales 

**RF01 – Iniciar sesión**

Muestra la interfaz donde se puede introducir el nombre de usuario y la contraseña del usuario para poder iniciar sesión y acceder a su cuenta.

**RF02 – Registrar usuario**

Muestra la interfaz donde se pueden introducir el nombre del perfil, nombre de usuario, la contraseña y seleccionar una foto elegida de galería para poder registrarse y crearse una cuenta.

**RF03 – Ver feed de contenido**

La aplicación mostrará al usuario un flujo de publicaciones de los usuarios registrados en la base de datos.

**RF04 – Ver perfil**

Si se hace clic en la foto de perfil del usuario de la publicación nos llevará a una vista en la cual podremos explorar el perfil de la cuenta, lo que incluirá ver todas sus publicaciones, la foto y el nombre de perfil, el nombre de usuario y la cantidad de publicaciones hechas por esa cuenta actualmente.

**RF05 – Crear publicación**

Si se hace clic en el símbolo de “más” en la barra de navegación inferior se nos desplegará una interfaz que nos permitirá crear una nueva publicación añadiendo una descripción, así como la opción de añadir una imagen para posteriormente publicarlo.

**RF06 – Ver mi perfil**

Al hacer clic en el ícono de “perfil” en la barra de navegación inferior, se desplegará la vista de nuestro perfil donde se mostrarán datos públicos del perfil, que incluyen el nombre de usuario, el nombre del perfil, la foto de perfil, la cantidad de publicaciones hechas hasta entonces y las publicaciones.

**RF07 – Ver configuración**

Al hacer clic en el ícono de “engranaje” en la barra de navegación inferior, se desplegará la una vista con las opciones “modificar datos de la cuenta”, “conocer más en GitHub”, “acerca de” y “cerrar sesión”.

**RF08 – Modificar datos de la cuenta**

Seleccionando esta opción permitirá modificar los datos de la cuenta, lo que incluye el nombre de perfil, el nombre del usuario, la contraseña y la descripción del perfil.

**RF09 – Conocer más en GitHub**

Esta opción abrirá en un navegador web la página del repositorio del proyecto en GitHub.

**RF10 – Acerca de**

Mostrará información sobre la aplicación y los creadores en una vista aislada.

**RF11– Cerrar sesión**

Cerrará la sesión activa en la aplicación.

## Diagrama de despliegue
<p align="center">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Diagrama%20de%20casos%20de%20uso.png">
</p>

## Vistas 

<p align="center">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Iniciar%20sesión.png">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Registro.png">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Inicio.png">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Crear%20publicación.png">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Perfil.png">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Perfil%20de%20usuario%20externo.png">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Configuración.png">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Editar%20datos%20de%20cuenta.png">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Acerca%20de.png">
  <img src="https://github.com/LuzR25/app_post_me/blob/main/Im%C3%A1genes/Tarjeta%20de%20publicación.png">
</p>

