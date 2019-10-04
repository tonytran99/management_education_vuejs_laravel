<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
})->name('welcome');

Route::get('register', function(){
	return view('register');
})->name('register');

Route::post('register_post', 'UserController@register');

Route::get('login', function(){
	return view('login');
})->name('login');

Route::post('login_post', 'UserController@login');

Route::get('logout', 'UserController@logout')->name('logout');


/* Admin */
Route::group(['prefix' => 'admin', 'middleware' => 'admin'], function(){
	Route::get('/',function(){
		return view('admin');
	})->name('admin');

	/* Student Management */
	Route::get('get_data_student_list','AdminController@get_data_student_list');

	/* Module Management */
	Route::get('get_data_module_list','AdminController@get_data_module_list');
	Route::post('create_data_module', 'AdminController@create_data_module');
	Route::delete('delete_data_module/{id}', 'AdminController@delete_data_module');
	Route::post('update_data_module/{id}', 'AdminController@update_data_module');

	/* Class Management */
	Route::get('get_data_class_list', 'AdminController@get_data_class_list');
	Route::get('get_data_class_by_module/{module_id}', 'AdminController@get_data_class_by_module');
	Route::get('get_all_module','AdminController@get_all_module');
	Route::post('create_data_class', 'AdminController@create_data_class');
	Route::delete('delete_data_class/{id}', 'AdminController@delete_data_class');
	Route::post('update_data_class/{id}', 'AdminController@update_data_class');

});


/* Student */
Route::group(['prefix' => 'student', 'middleware' => 'student'], function(){
	Route::get('/',function(){
		return view('student');
	})->name('student');

	/* Student Information */
	Route::get('get_student_info','StudentController@get_student_info');
	Route::post('update_student_info/{student_id}','StudentController@update_student_info');
	
	/* Module Management */
	Route::get('get_all_module', 'StudentController@get_all_module');
	Route::get('get_data_student_module_list', 'StudentController@get_data_student_module_list');
	Route::post('add_data_student_module', 'StudentController@add_data_student_module');
	Route::delete('delete_data_student_module/{id}', 'StudentController@delete_data_student_module');

	/* Class Management */
	Route::get('get_all_student_module', 'StudentController@get_all_student_module');
	Route::get('get_all_class', 'StudentController@get_all_class');
	Route::get('get_data_student_class_list', 'StudentController@get_data_student_class_list');
	Route::get('get_class_by_student_module/{student_module_id}', 'StudentController@get_class_by_student_module');
	Route::post('add_data_student_class', 'StudentController@add_data_student_class');
	Route::delete('delete_data_student_class/{id}', 'StudentController@delete_data_student_class');
});

