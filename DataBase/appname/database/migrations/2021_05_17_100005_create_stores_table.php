<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('stores');

        Schema::create('stores', function (Blueprint $table) {
            $table->unsignedSmallInteger('idStore')->index('payments_stores_idstore_foreign');
            $table->string('storeName');
            $table->timestamp('lastUpdate')->nullable();
            $table->unsignedSmallInteger('address_idAddress');


            $table->foreign('address_idAddress')->references('idAddress')->on('addresses');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stores');
    }
}
