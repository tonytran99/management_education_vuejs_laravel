<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Student;
use App\User;
use App\Module;
use App\Classs;
use App\StudentModule;
use App\StudentClass;

use Illuminate\Support\Facades\Auth;

class StudentController extends Controller
{
    /* Student Information */
    public function get_student_info()
    {
        if(Auth::check() && Auth::user()->role == 0)
        {
            $user = Auth::user();
            $user_id = $user->id;
            $student = Student::where('user_id', $user_id)->first();
            return [$user, $student];
        }
    }

    public function update_student_info(Request $request, $id)
    {
        $student = Student::find($id);
        $data_student =$request->all();
        if($request->hasFile('image'))
        {
            $data_student = $request->all();
            $image = $request->image;
            $student_code = $student->student_code;
            $image_extension = $image->getClientOriginalExtension();
            $image_name = $student_code . '.' . $image_extension;

            $old_image = $student->image;
            if($old_image != 'default.png')
            {
                unlink('uploads/students/' . $old_image);
            }
            $image->move('uploads/students', $image_name);
            $data_student['image'] = $image_name;
        }
        $student->update($data_student);    	
    }

    /* Module Management */
    public function get_all_module()
    {
        $module = Module::orderBy('id', 'DESC')->get();
        return $module;
    }

    public function get_data_student_module_list()
    {
        $student_module = StudentModule::orderBy('id', 'DESC')->paginate(5);
        return $student_module;
    }


    public function add_data_student_module(Request $request)
    {
        if(Auth::check() && Auth::user()->role == 0)
        {
            $user = Auth::user();
            $user_id = $user->id;
            $student = Student::where('user_id', $user_id)->first();
            $student_id = $student->id;
            $module_id = $request->module_id;
            if(StudentModule::where('student_id', $student_id)->where('module_id', $module_id)->count())
            {
                return response()->json(['res_type' => 'error', 'response' => 'Module already exists in registered modules !']);
            }
            else
            {
                $data_student_module = [
                    'student_id' => $student_id,
                    'module_id' => $module_id
                ];
                StudentModule::create($data_student_module);
                return response()->json(['res_type' => 'success', 'response' => 'Add Module Successfully !']);
            }
        }
    }

    public function delete_data_student_module($id)
    {
        $student_module = StudentModule::find($id);
        $student_module->delete();
    }

    /**/
    public function get_all_student_module()
    {
        if(Auth::check() && Auth::user()->role == 0)
        {
            $user = Auth::user();
            $user_id = $user->id;
            $student = Student::where('user_id', $user_id)->first();
            $student_id = $student->id;
            $student_module = StudentModule::where('student_id', $student_id)->get();
            // return $student_module;
            // $student_module_detail = [$count];
            foreach ($student_module as $key => $stu_mod) {
                $student_module_detail[$key]['name'] = $stu_mod->Module->name;
                $student_module_detail[$key]['module_code'] = $stu_mod->Module->module_code;
                $student_module_detail[$key]['student_module_id'] = $stu_mod->id;
            }
            return $student_module_detail;
        }
        
    }
    public function get_all_class()
    {
        $class = Classs::orderBy('id', 'DESC')->get();
        return $class;
    }

    public function get_data_student_class_list()
    {
        $student_class = StudentClass::orderBy('id', 'DESC')->paginate(5);
        return $student_class; 
    }

    public function get_class_by_student_module($student_module_id)
    {
        $student_module = StudentModule::find($student_module_id);
        $module_id = $student_module->module_id;
        $class = Classs::where('module_id', $module_id)->get();
        return $class;
    }

    public function add_data_student_class(Request $request)
    {
        if(Auth::check() && Auth::user()->role == 0)
        {
            $user = Auth::user();
            $user_id = $user->id;
            $student = Student::where('user_id', $user_id)->first();
            $student_id = $student->id;


            $student_module_id = $request->student_module_id;
            if(StudentClass::where('student_module_id', $student_module_id)->count())
            {
                return response()->json(['res_type' => 'error', 'response' => 'You can not register two class of module !']);
            }
            else
            {
                $class_id = $request->class_id;
                $class = Classs::find($class_id);
                if($class->current_quantity == $class->max_quantity)
                {
                    return response()->json(['res_type' => 'error', 'response' => 'Class are full !']); 
                }
                else
                {
                    $class = Classs::find($class_id);
                    $current_quantity = $class->current_quantity;
                    $current_quantity++;
                    $data_update_class = [
                        'current_quantity' => $current_quantity
                    ];
                    $class->update($data_update_class);

                    $data_student_class = [
                        'student_module_id' => $student_module_id,
                        'class_id' => $class_id,
                        'student_id' => $student_id
                    ];
                    StudentClass::create($data_student_class);
                    return response()->json(['res_type' => 'success', 'success' => 'Add Class Successfully !']);
                }
            }
        }
    }

    public function delete_data_student_class($id){
        $student_class = StudentClass::find($id);
        $class_id = $student_class->class_id;
        $class = Classs::find($class_id);
        $current_quantity = $class->current_quantity;
        $current_quantity--;
        $data_update_class = [
            'current_quantity' => $current_quantity
        ];
        $class->update($data_update_class);

        $student_class->delete();
    }
}
