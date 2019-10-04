<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentClass extends Model
{
    protected $table = 'student_classes';

    protected $fillable = [
    	'student_module_id', 'class_id', 'student_id'
    ];
}
