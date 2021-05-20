<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Schema::dropIfExists('cities');
        Schema::create('cities', function (Blueprint $table) {
            $table->unsignedSmallInteger('idCity')->index('address_cities_idcity_foreign');
            $table->string('city');
            $table->timestamp('lastUpdate');
            $table->unsignedSmallInteger('countries_idCountry');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cities');
    }
}
