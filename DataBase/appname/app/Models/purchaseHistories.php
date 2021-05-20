<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class purchaseHistories extends Model
{
    use HasFactory;

    protected $primaryKey = 'idpurchaseHistories';

    public function bill() {
        return $this->belongsTo('App\Models\bill');
    }
    public function tickets() {
        return $this->belongsTo('App\Models\tickets');
    }
    public function paymentmethods() {
        return $this->hasMany('App\Models\paymentmethods');
    }
}
