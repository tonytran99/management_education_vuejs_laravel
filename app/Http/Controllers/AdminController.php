<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Student;
use App\Module;
use App\Classs;
use Validator;
class AdminController extends Controller
{
    public function get_data_student_list()
    {
    	$student = Student::orderBy('id', 'DESC')->paginate(5);
    	return $student;
    }

    public function get_data_module_list()
    {
    	$module = Module::orderBy('id', 'DESC')->paginate(5);
    	return $module;
    }

    public function create_data_module(Request $request)
    {
    	$validator = Validator::make($request->all(), 
    		[
    			'name' => 'unique:modules,name|min:3|max:255',
    		]
    		,
    		[
    			'name.unique' => ':attribute already exists in system !',
    			'name.min' 		=> ':attribute must be at least 3 characters long !',
    			'name.max' 		=> ':attribute must be a maximum of 255 characters long !',
    		]
    		,
    		[
    			'name' => 'Module',
    		]
    	);
    	if($validator->fails())
    	{
    		return response()->json(['res_type' => 'error', 'response' => $validator->errors()]);
    	}
    	else
    	{
    		$data_module = $request->all();

	    	$data_module['module_code'] = "M".rand(1000, 9999);
	        while(Module::where('module_code', $data_module['module_code'])->count())
	        {
	            $data_module['module_code'] = "M".rand(1000, 9999);
	        }

	 		Module::create($data_module);
	 		return response()->json(['res_type' => 'success', 'response' => 'Add Module Successfully !']);
    	}
    }

    public function delete_data_module($id)
    {
    	$module = Module::find($id);
    	$module->delete();
    }

    public function update_data_module(Request $request, $id)
    {
    	$validator = Validator::make($request->all(), 
    		[
    			'name' => 'unique:modules,name,'.$id.'|min:3|max:255',
    		]
    		,
    		[
    			'name.unique' => ':attribute already exists in system !',
    			'name.min' 		=> ':attribute must be at least 3 characters long !',
    			'name.max' 		=> ':attribute must be a maximum of 255 characters long !',
    		]
    		,
    		[
    			'name' => 'Module',
    		]
    	);
    	if($validator->fails())
    	{
    		return response()->json(['res_type' => 'error', 'response' => $validator->errors()]);
    	}
    	else
    	{
    		$module = Module::find($id);
    		$data_module = $request->all();

	 		$module->update($data_module);
	 		return response()->json(['res_type' => 'success', 'response' => 'Add Module Successfully !']);
    	}
    }

    public function get_data_class_list()
    {
    	$class = Classs::orderBy('id', 'DESC')->paginate(5);
    	return $class;
    }

    public function get_data_class_by_module($module_id)
    {
    	$class = Classs::where('module_id', $module_id)->orderBy('id', 'DESC')->get();
    	return $class;
    }

    public function get_all_module()
    {
    	$module = Module::orderBy('id', 'DESC')->get();
    	return $module;
    }


    public function create_data_class(Request $request)
    {
    	$data_class = $request->all();
		$data_class['class_code'] = "C".rand(1000, 9999);
        while(Classs::where('class_code', $data_class['class_code'])->count())
        {
            $data_class['class_code'] = "C".rand(1000, 9999);
        }
    	Classs::create($data_class);
    }

    public function delete_data_class($id)
   {
    	$class = Classs::find($id);
    	$class->delete();   	
   } 

   public function update_data_class(Request $request, $id)
   {
   		$data_class = $request->all();
   		$class = Classs::find($id);
   		$class->update($data_class);
   }

}
