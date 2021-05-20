<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBillsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('bills');
        Schema::create('bills', function (Blueprint $table) {
            $table->id('idBill');
            $table->timestamp('billDate')->nullable();
            $table->smallInteger('billValidate');
            $table->integer('billToken');
            $table->unsignedBigInteger('customers_idCustomer');
            $table->unsignedBigInteger('payments_idPayment');
            $table->float('discount');
            $table->float('value');
            $table->float('price');
            
            $table->foreign('customers_idCustomer')->references('idCustomer')->on('customers');
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
        Schema::dropIfExists('bills');
    }
}
