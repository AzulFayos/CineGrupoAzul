<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tabla extends Model
{
    use HasFactory;

    public function stores(){
        return $this->hasMany('App\Models\stores');//, 'address_idAddress', 'idStore');
    }

}
