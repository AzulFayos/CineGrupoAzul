<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class trailers extends Model
{
    use HasFactory;

    protected $primaryKey = 'idTrailer';

    public function movies_trailers() {
        return $this->hasMany('App\Models\movies_trailers');
    }
}
