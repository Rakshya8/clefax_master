<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->date('date');
            $table->boolean('status')->default('0');
            $table->decimal('subtotal');
            $table->decimal('total');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('collection_id');
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('collection_id')->references('id')->on('collection_slots');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
