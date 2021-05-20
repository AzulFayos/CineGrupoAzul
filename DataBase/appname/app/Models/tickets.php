<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tickets extends Model
{
    use HasFactory;

    protected $primaryKey = 'idTicket';
    
    public function payments() {
        return $this->belongsTo('App\Models\payments');
    }
    public function purchaseHistories() {
        return $this->hasMany('App\Models\purchaseHistories');
    }
    public function movies() {
        return $this->belongsTo('App\Models\movies');
    }
    public function marathones() {
        return $this->belongsTo('App\Models\marathones');
    }
    public function customers() {
        return $this->belongsTo('App\Models\customers');
    }
    public function events() {
        return $this->belongsTo('App\Models\events');
    }
    public function Halls() {
        return $this->belongsTo('App\Models\Halls');
    }
}

