<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuarios extends Model
{
    protected $primaryKey = 'idUsuario';
    protected $fillable = [
        'idUsuario',
        'nombreUsuario',
        'nombreCuenta',
        'contrasena',
        'fotoPerfil'
    ];
    use HasFactory;
}
