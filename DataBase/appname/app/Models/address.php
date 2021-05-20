<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class address extends Model
{
    use HasFactory;

    protected $primaryKey = 'idAddress';

    //Relación uno a muchos
    public function stores(){
        return $this->hasMany('App\Models\stores');//, 'address_idAddress', 'idStore');
    }
    public function customers(){
        return $this->hasMany('App\Models\customers');//, 'address_idAddress', 'idCustomer');
    }
    public function cities() {
        return $this->belongsTo('App\Models\cities');//, 'cities_idCity', 'idAddress');
    }

}
