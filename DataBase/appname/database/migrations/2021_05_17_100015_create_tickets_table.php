<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('tickets');
        Schema::create('tickets', function (Blueprint $table) {
            $table->id('idTicket');
            $table->float('ticketPrice');
            $table->unsignedBigInteger('movies_idMovie');
            $table->timestamp('lastUpdate')->nullable();
            $table->unsignedBigInteger('payments_idPayment');
            $table->unsignedBigInteger('customers_idCustomer');
            $table->float('price');
            $table->float('discount');
            $table->float('ticketValue');
            $table->string('ticketName');
            $table->string('description');
            $table->string('termCondition');
            $table->timestamp('date')->nullable();
            $table->unsignedBigInteger('events_idEvent');
            $table->unsignedBigInteger('marathones_idMarathones');
            $table->unsignedSmallInteger('halls_idHall');

            $table->foreign('movies_idMovie')->references('idMovie')->on('movies');
            $table->foreign('payments_idPayment')->references('idPayment')->on('payments');
            $table->foreign('customers_idCustomer')->references('idCustomer')->on('customers');
            $table->foreign('events_idEvent')->references('idEvent')->on('events');
            $table->foreign('marathones_idMarathones')->references('idMarathones')->on('marathones');
            $table->foreign('halls_idHall')->references('idHall')->on('halls');


     
        });
    }

    /**
     * Reverse the migrations.
     * 
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tickets');
    }
}
