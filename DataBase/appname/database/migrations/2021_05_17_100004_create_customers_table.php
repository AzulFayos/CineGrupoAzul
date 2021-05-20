<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Schema::dropIfExists('customers');
        Schema::create('customers', function (Blueprint $table) {
            $table->unsignedBigInteger('idCustomer')->index('bills_customers_idcustomer_foreign');
            $table->string('firstName');
            $table->string('lastName');
            $table->dateTime('createDate');
            $table->unsignedSmallInteger('address_idAddress');
            $table->unsignedBigInteger('users_idUser');


            $table->foreign('address_idAddress')->references('idAddress')->on('addresses');
            $table->foreign('users_idUser')->references('idUser')->on('users');

            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers');
    }
}
