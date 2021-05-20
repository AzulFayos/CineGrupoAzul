<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Schema::dropIfExists('events');
        Schema::create('events', function (Blueprint $table) {
            $table->id('idEvent');
            $table->unsignedBigInteger('payments_idPayment');
            $table->string('synopsis');
            $table->string('eventTitle');
            $table->string('eventCategory');
            $table->timestamp('lastUpdate')->nullable();

            $table->foreign('payments_idPayment')->references('idPayment')->on('payments');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}
