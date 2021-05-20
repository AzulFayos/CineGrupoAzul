<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cities extends Model
{
    use HasFactory;

    protected $primaryKey = 'idCity';

    public function address(){

        return $this->hasMany('App\Models\address');
    }
}
