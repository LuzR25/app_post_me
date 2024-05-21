<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Usuarios;
use Illuminate\Support\Facades\DB;


class UsuariosController extends Controller
{
    /**
     * Regresa un solo usuario.
     */
    public function show(Request $request, Usuarios $usuario){ // Buscar usuario Funciona
        /* $id = $request->idUsuario; */
        $u = Usuarios::find($usuario)->first();
        return response()->json($u, 200);
    }

    /**
     * Busca al usuario y si existe hace el login.
     */
    public function entrar(Request $request){
        /* $id = $request->idUsuario; */
        /* $u = Usuarios::find($usuario)->first(); */
        $u = Usuarios::where('nombreCuenta', '=', $request->nombreCuenta) -> first();
        
        if($u->contrasena == $request->contrasena){
            return response()->json($u, 200);
        }
        /* return response()->json($request->nombreCuenta, 200); */
    }
    
    /**
     * Crea un nuevo usuario en la BD.
     */
    public function store(Request $request){ //Guardar un nuevo usuario Funciona
        $usuario = new Usuarios();
        $usuario -> nombreCuenta = $request->nombreCuenta;
        $usuario -> nombreUsuario = $request->nombreUsuario;
        $usuario -> contrasena = $request->contrasena;
        $usuario -> fotoPerfil = $request->fotoPerfil;

        $usuario->save();
        return response()->json($usuario, 200);
    }

    /**
     * Actualiza los campos editados de un usuario existente.
     */
    public function update(Request $request, Usuarios $usuario){ // Editar usuario
        /* $id = $request->idUsuario; */
        $u = Usuarios::find($usuario)->first();
        $u -> nombreCuenta = $request->nombreCuenta;
        $u -> nombreUsuario = $request->nombreUsuario;
        $u -> contrasena = $request->contrasena;
        $u -> fotoPerfil = $request->fotoPerfil;
        $u->save();
        return response()->json($u, 200);
        
        /* if (($request->descripcion) != "") {
            $edit = Usuarios::where('idUsuario', $request->idUsuario)->get()->first();
            $edit -> descripcion = $request -> descripcion;
            $edit->save();
        } */

        
        /* return Redirect::to('http://127.0.0.1:8000/showAllPubFormat'); */
    }
}
