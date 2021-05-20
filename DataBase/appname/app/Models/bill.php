<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class bill extends Model
{
    protected $primaryKey = 'idBill';
    
    use HasFactory;
    public function payments() {
        return $this->belongsTo('App\Models\payments');
    }
    public function purchaseHistories() {
        return $this->hasMany('App\Models\purchaseHistories');
    }
    public function customers() {
        return $this->belongsTo('App\Models\customers');
    }
}
