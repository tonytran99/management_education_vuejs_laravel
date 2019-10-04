<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentModule extends Model
{
    protected $table = 'student_modules';

    protected $fillable = [
    	'module_id', 'student_id'
    ];

    public function Module()
    {
    	return $this->belongsTo('App\Module');
    }
}
