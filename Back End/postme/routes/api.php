<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PublicacionesController;
use App\Http\Controllers\UsuariosController;


#  PUBLICACIONES
/* Route::resource('publicaciones', "App\Http\Controllers\PublicacionesController"); */
Route::get('/publicaciones/obtener', [PublicacionesController::class, 'index']); # Correcto Muestra todas las publicaciones
Route::post('/publicaciones/save', [PublicacionesController::class, 'store']); # Correcto Guarda una publicacion
Route::post('/publicaciones', [PublicacionesController::class, 'show']); # Correcto Muestra todas las publicaciones de un solo usuario
Route::get('/publicaciones/a', [PublicacionesController::class, 'a']); # Correcto Muestra todas las publicaciones



# USUARIOS
/* Route::resource('usuarios', "App\Http\Controllers\UsuariosController"); */
Route::get('/usuarios/{usuario}', [UsuariosController::class, 'show']); # Correcto Busca a un usuario con su id
Route::post('/usuarios/login', [UsuariosController::class, 'entrar']); # Correcto Loggearse

Route::post('/usuarios', [UsuariosController::class, 'store']); # Correcto Crea un nuevo usuario
Route::put('/usuarios/{usuario}', [UsuariosController::class, 'update']); # Funciona

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

/* Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
}); */
