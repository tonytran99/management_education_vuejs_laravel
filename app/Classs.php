<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Classs extends Model
{
    protected $table = 'classes';

    protected $fillable = [
    	'module_id', 'class_code', 'room', 'max_quantity', 'current_quantity'
    ];
}
