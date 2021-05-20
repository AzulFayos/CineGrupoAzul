<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class movies extends Model
{
    use HasFactory;

    protected $primaryKey = 'idMovie';
    
    public function posters() {
        return $this->hasMany('App\Models\posters');
    }
    public function movies_trailers() {
        return $this->hasMany('App\Models\movies_trailers');
    }
    public function tickets() {
        return $this->hasMany('App\Models\tickets');
    }
}
