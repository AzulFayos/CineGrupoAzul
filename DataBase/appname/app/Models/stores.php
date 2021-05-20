<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class stores extends Model
{
    use HasFactory;

    protected $primaryKey = 'idStore';

    //Relación uno a muchos inversa
    public function address() {
        return $this->belongsTo('App\Models\address');//, 'address_idAddress', 'idAddress');
    }
    public function payments() {
        return $this->hasMany('App\Models\payments');
    }

}