<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTrailersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Schema::dropIfExists('trailers');
        Schema::create('trailers', function (Blueprint $table) {
            $table->id('idTrailer');
            $table->string('trailerURL');
            $table->string('trailerURL2');
            $table->timestamp('lastUpdate')->nullable();
            $table->string('trailerLanguage');
            $table->unsignedBigInteger('movies_idMovie');

            $table->foreign('movies_idMovie')->references('idMovie')->on('movies');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('trailers');
    }
}
