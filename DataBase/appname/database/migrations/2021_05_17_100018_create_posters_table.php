<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
       // Schema::dropIfExists('posters');
        Schema::create('posters', function (Blueprint $table) {
            $table->id('idPoster');
            $table->timestamp('lastUpdate')->nullable();
            $table->string('posterName');
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
        Schema::dropIfExists('posters');
    }
}
