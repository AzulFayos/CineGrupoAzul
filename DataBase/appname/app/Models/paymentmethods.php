<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class paymentmethods extends Model
{
    use HasFactory;

    protected $primaryKey = 'idpaymentmethods';
    
    public function purchaseHistories() {
        return $this->belongsTo('App\Models\purchaseHistories');
    }
}
