<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCreditCardsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('credit_cards');
        Schema::create('credit_cards', function (Blueprint $table) {
            $table->id('idcreditcard');
            $table->bigInteger('creditCardNumber');
            $table->smallInteger('credirCardCvv');
            $table->string('creditCardExpiryYear');
            $table->string('creditCardExpiryDate');
            $table->string('creditCardOwner');
            $table->string('creditCardType');     
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('credit_cards');
    }
}
