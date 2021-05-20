<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class posters extends Model
{
    use HasFactory;

    protected $primaryKey = 'idPoster';

    public function PosterLink() {
        return $this->hasMany('App\Models\PosterLink');
    }
    public function movies() {
        return $this->belongsTo('App\Models\movies');
    }
}
