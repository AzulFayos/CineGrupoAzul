<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDebitCardsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Schema::dropIfExists('debit_cards');
        Schema::create('debit_cards', function (Blueprint $table) {
            $table->id('idDebitCard');
            $table->string('debitCardType');
            $table->smallInteger('debitCardCvv');
            $table->string('debitCardExpiryDate');
            $table->string('debitCardOwner');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('debit_cards');
    }
}
