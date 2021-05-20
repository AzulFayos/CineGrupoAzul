<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMarathonesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('marathones');
        Schema::create('marathones', function (Blueprint $table) {
            $table->id('idMarathones');
            $table->string('titleMovie');
            $table->integer('marathonRuntime');
            $table->string('synopsis');
            $table->double('marathonRating');
            $table->timestamp('lastUpdate')->nullable();
            $table->unsignedBigInteger('payments_idPayment');
            $table->string('marathonCategory');

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
        Schema::dropIfExists('marathones');
    }
}
