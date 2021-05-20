<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('addresses');
        Schema::create('address', function (Blueprint $table) {
            $table->unsignedSmallInteger('idAddress')->index('customers_address_idaddress_foreign', 'stores_address_idaddress_foreign');
            $table->string('address');
            $table->string('address2')->nullable();
            $table->string('district');
            $table->string('postalCode')->nullable();
            $table->bigInteger('phone');
            $table->timestamp('lastUpdate');
            $table->string('country');
            $table->unsignedSmallInteger('cities_idCity');

            $table->foreign('cities_idCity')->references('idCity')->on('cities')->onDelete('cascade')->onUpdate('cascade');

            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('address');
    }
}
