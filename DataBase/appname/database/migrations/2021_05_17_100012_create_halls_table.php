<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHallsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Schema::dropIfExists('halls');
        Schema::create('halls', function (Blueprint $table) {
            $table->unsignedSmallInteger('idHall')->index('seats_halls_idhall_foreign');
            $table->unsignedSmallInteger('hallNumber');
            $table->timestamp('lastUpdate')->nullable();          
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('halls');
    }
}
