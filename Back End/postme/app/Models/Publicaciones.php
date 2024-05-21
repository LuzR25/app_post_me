<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Publicaciones extends Model
{
    protected $primaryKey = 'numPublicacion';
    protected $fillable = [
        'idUsuario',
        'numPublicacion',
        'descripcion',
        'foto',
        'fotoPerfil'
    ];
    use HasFactory;
}
