<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePosterLinksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('poster_links');
        Schema::create('posterLink', function (Blueprint $table) {
            $table->id('idPoster');
            $table->integer('idPosterLink');
            $table->UnsignedBigInteger('posters_idPoster');
            $table->UnsignedBigInteger('users_idUser');

            $table->foreign('posters_idPoster')->references('idPoster')->on('posters');
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
        Schema::dropIfExists('poster_links');
    }
}




























































//almendrero_de_doraemon!
//que_florece_en_la_serie_de_Droaemon!