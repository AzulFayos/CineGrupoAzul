<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchaseHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Schema::dropIfExists('purchase_histories');
        Schema::create('purchaseHistories', function (Blueprint $table) {
            $table->id('idpurchaseHistories');
            $table->timestamp('lastUpdate')->nullable();
            $table->unsignedBigInteger('tickets_idTicket');
            $table->unsignedBigInteger('bill_idBill');
          
            $table->foreign('tickets_idTicket')->references('idTicket')->on('tickets');
            $table->foreign('bill_idBill')->references('idBill')->on('bills');
        
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('purchase_histories');
    }
}
