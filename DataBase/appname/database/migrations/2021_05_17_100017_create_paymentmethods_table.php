<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentmethodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('paymentmethods');
        Schema::create('paymentmethods', function (Blueprint $table) {
            $table->id('idpaymentmethods');
            $table->unsignedBiginteger('purchaseHistories_idpurchaseHistories');


            $table->foreign('purchaseHistories_idpurchaseHistories')->references('idpurchaseHistories')->on('purchaseHistories');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('paymentmethods');
    }
}
