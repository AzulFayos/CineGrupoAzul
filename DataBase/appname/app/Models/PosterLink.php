<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PosterLink extends Model
{
    use HasFactory;

    protected $primaryKey = 'idPoster';
    
    public function posters() {
        return $this->belongsTo('App\Models\posters');
    }
    public function users() {
        return $this->belongsTo('App\Models\users');
    }
}
