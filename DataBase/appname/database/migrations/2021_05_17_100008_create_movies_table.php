<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMoviesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Schema::dropIfExists('movies');
        Schema::create('movies', function (Blueprint $table) {
            $table->id('idMovie')->index('movies_trailers_movies_idmovie_foreign');
            $table->string('titleMovie');
            $table->integer('movieRuntime');
            $table->string('synopsis');
            $table->timestamp('movieReleaseDate')->nullable();
            $table->enum('movieCertificate', ['N/A', 'PG', '12', '18', '12A', '15', '15A', '16'])->nullable();
            $table->double('movieRating');
            $table->unsignedSmallInteger('original_language_id');
            $table->string('specialFeatures');
            $table->timestamp('lastUpdate')->nullable();
            $table->string('languages_idLanguage');
            $table->string('actors');
            $table->string('languages');
            $table->string('movieCategory');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('movies');
    }
}
