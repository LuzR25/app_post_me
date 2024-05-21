<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Publicaciones;
use App\Models\Usuarios;
use Illuminate\Support\Facades\DB; // Para hacer consultas a la base de datos
use Illuminate\Support\Facades\Redirect; // Para mandar denuevo al formulario
use Illuminate\Database\Eloquent\Model;


/**
 * a
 * @method public index();
 */
class PublicacionesController extends Controller
{
    /**
     * Regresa todas las publicaciones existentes en la BD
     
     */
    public function index(){
        $posts=Publicaciones::all();
        foreach ($posts as $key => $post) {
            $u = Usuarios::find($post->idUsuario);
            if ($post->fotoPerfil != $u->fotoPerfil) {
                $post->fotoPerfil = $u->fotoPerfil;
                $post->save();
            }
            if ($post->nombreCuenta != $u->nombreCuenta) {
                $post->nombreCuenta = $u->nombreCuenta;
                $post->save();
            }
        }
        $p=Publicaciones::all();
        return response()->json($p, 200, ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'], JSON_UNESCAPED_UNICODE);        
    }
    public function a(){
        $posts=Publicaciones::all();
        foreach ($posts as $key => $post) {
            $u = Usuarios::find($post->idUsuario);
            if ($post->fotoPerfil != $u->fotoPerfil) {
                $post->fotoPerfil = $u->fotoPerfil;
                $post->save();
            }
            if ($post->nombreCuenta != $u->nombreCuenta) {
                $post->nombreCuenta = $u->nombreCuenta;
                $post->save();
            }
        }
        $p=Publicaciones::all();
        return response()->json($p, 200, ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'], JSON_UNESCAPED_UNICODE);        
    }

    /**
     * Regresa todas las publicaciones existentes de un usuario
     */
    public function show(Request $request){ // Regresa todas las publicaciones existentes de un usuario
        $posts = publicaciones::where('idUsuario', '=', $request->idUsuario)->get();
        foreach ($posts as $key => $post) {
            $u = Usuarios::find($request->idUsuario);
            if ($post->fotoPerfil != $u->fotoPerfil) {
                $post->fotoPerfil = $u->fotoPerfil;
                $post->save();
            }
            if ($post->nombreCuenta != $u->nombreCuenta) {
                $post->nombreCuenta = $u->nombreCuenta;
                $post->save();
            }
            
        }
        $p= publicaciones::where('idUsuario', '=', $request->idUsuario)->get();
        return response()->json($p, 200);        
    }

    public static function actualizar(){
        $maxValue = Publicaciones::max('numPublicacion');
        $post = Publicaciones::where('numPublicacion', '=', $maxValue)->get()->first();
        $u = Usuarios::find($post->idUsuario)->first();
        $post-> fotoPerfil = $u->fotoPerfil;
        $post->save();
    }
    /**
     * Guarda una publicacion en la base de datos
     */
    public function store(Request $request){ // Guarda la publicacion en la base de datos
        $post = new Publicaciones();

        $u = Usuarios::find($request->idUsuario)->first(); # Encuentro la cuenta dueña de la publicación
        $post-> nombreCuenta = $u->nombreCuenta;        # Nombre cuenta

        $post-> idUsuario = $request->idUsuario;        # idUsuario
        
        #$post-> numPublicacion = $request->numPublicacion; # numPublicacion

        $post-> descripcion = $request->descripcion;        # descripcion

        $post-> foto = $request->foto;      # foto

        $post-> fotoPerfil = $request->fotoPerfil;

        $post->save();
        $date = date('Y-m-d');
        $post -> fecha = $date;
        
        return response()->json($post, 200, ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'], JSON_UNESCAPED_UNICODE);
    }
    
    /* public function postDelete(Request $request){ // borra una publicacion
        DB::delete('delete from publicaciones where numPublicacion = ?',[$request->numPublicacion]);
    }
    
    public function postEdit(Request $request){ // borra una publicacion
        if ($request->descripcion != "") {
            $edit = Publicaciones::where('numPublicacion', $request->numPublicacion)->get()->first(); # Aquí creo que podría cambiarlo para usar find y encontrar directamente esa publicacion
            $edit -> descripcion = $request -> descripcion;
            $edit->save();
        }
    } */
}
