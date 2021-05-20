<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSeatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('seats');
        Schema::create('seats', function (Blueprint $table) {
            $table->id('idSeats');
            $table->string('seatPosition');
            $table->timestamp('lastUpdate')->nullable();
            $table->unsignedSmallInteger('Halls_idHall');

            $table->foreign('Halls_idHall')->references('idHall')->on('halls');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('seats');
    }
}
