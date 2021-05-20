<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class marathones extends Model
{
    use HasFactory;

    protected $primaryKey = 'idMarathones';

    public function payments() {
        return $this->belongsTo('App\Models\payments');
    }
    public function tickets() {
        return $this->hasMany('App\Models\tickets');
    }
}
