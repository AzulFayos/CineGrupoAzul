<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Halls extends Model
{
    use HasFactory;

    protected $primaryKey = 'idHall';

    public function Seats() {
        return $this->hasMany('App\Models\Seats');
    }
    public function tickets() {
        return $this->hasMany('App\Models\tickets');
    }
}
