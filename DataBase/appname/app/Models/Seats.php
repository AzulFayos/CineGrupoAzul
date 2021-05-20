<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Seats extends Model
{
    use HasFactory;

    protected $primaryKey = 'idSeats';

    public function Halls() {
        return $this->belongsTo('App\Models\Halls');
    }
}
