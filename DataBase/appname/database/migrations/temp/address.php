<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class address extends Model
{
    use HasFactory;

    //Relación uno a muchos
    public function stores(){
        return $this->hasMany('App\Models\stores');
    }
    public function customers(){
        return $this->hasMany('App\Models\customers');
    }
    public function cities() {
        return $this->belongsTo('App\Models\cities');
    }

}
