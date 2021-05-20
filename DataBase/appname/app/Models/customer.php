<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class customer extends Model
{
    protected $primaryKey = 'idCustomer';

    use HasFactory;
    public function address() {
        return $this->belongsTo('App\Models\address');
    }
    public function bill() {
        return $this->hasMany('App\Models\bill');
    }
    public function tickets() {
        return $this->hasMany('App\Models\tickets');
    }
    public function users() {
        return $this->belongsTo('App\Models\users');
    }
}
