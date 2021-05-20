<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('payments');
        Schema::create('payments', function (Blueprint $table) {
            $table->id('idPayment');
            $table->float('amount');
            $table->timestamp('paymentDate')->nullable();
            $table->timestamp('lastUpdate')->nullable();
            $table->unsignedSmallInteger('staffs_idStaff');
            $table->integer('types_idtype');
            $table->unsignedSmallInteger('stores_idStore');
           
            $table->foreign('stores_idStore')->references('idStore')->on('stores');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payments');
    }
}
