<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class payments extends Model
{
    use HasFactory;

    protected $primaryKey = 'idPayment';
    
    public function stores() {
        return $this->belongsTo('App\Models\stores');
    }
    public function marathones() {
        return $this->hasMany('App\Models\marathones');
    }
    public function events() {
        return $this->hasMany('App\Models\events');
    }
    public function bill() {
        return $this->hasMany('App\Models\bill');
    }
    public function tickets() {
        return $this->hasMany('App\Models\tickets');
    }

}
