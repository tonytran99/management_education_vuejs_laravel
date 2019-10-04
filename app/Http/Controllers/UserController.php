<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Student;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Validator;

class UserController extends Controller
{
    public function register(Request $request)
    {
    	$validator = Validator::make($request->all(), 
    		[
    			'email' => 'unique:users,email',
    			'password' => 'min:8|max:255',
    			'confirm_password' => 'same:password'
    		]
    		,
    		[
    			'email.unique' => ':attribute already exists in system !',
    			'password.min' 		=> ':attribute must be at least 8 characters long !',
    			'password.max' 		=> ':attribute must be a maximum of 255 characters long !',
    			'confirm_password.same' => ':attribute must be the same as the password !'
    		]
    		,
    		[
    			'email' => 'Email',
    			'password' => 'Password',
    			'confirm_password' => 'Confirm password'
    		]
    	);
    	if($validator->fails())
    	{
    		return response()->json(['res_type' => 'error', 'response' => $validator->errors()]);
    	}
    	else
    	{
    		$data_user['email'] = $request->email;
    		$data_user['password'] = Hash::make($request->password);
    		$user = User::create($data_user);
    		Auth::login($user);
    		$user_id = $user->id;

            $data_student['student_code'] = "S".rand(1000, 9999);
            while(Student::where('student_code', $data_student['student_code'])->count())
            {
                $data_student['student_code'] = "S".rand(1000, 9999);
            }
    		$data_student['user_id'] = $user_id;
    		Student::create($data_student);
    		return response()->json(['res_type' => 'success', 'response' => 'Congratulations on your successful account registration !']);
    	}
    	
    }

    public function login(Request $request)
    {
    	$validator = Validator::make($request->all(), 
    		[
    			'password' => 'min:8|max:255'
    		]
    		,
    		[
    			'password.min' 		=> ':attribute must be at least 8 characters long !',
    			'password.max' 		=> ':attribute must be a maximum of 255 characters long !'
    		]
    		,
    		[
    			'password' => 'Password'
    		]
    	);

    	if($validator->fails())
    	{
    		return response()->json(['res_type' => 'error', 'response' => $validator->errors()]);
    	}
    	else
    	{
    		$email = $request->email;
    		$password = $request->password;
    		$remember = $request->remember;

    		if(Auth::attempt(['email' => $email, 'password' => $password, 'role' => 0], $remember))
    		{
    			return response()->json(['res_type' => 'success', 'role' => 0, 'response' => 'Hello Student, Login successfully !']); 
    		}
    		else if(Auth::attempt(['email' => $email, 'password' => $password, 'role' => 1], $remember))
    		{
    			return response()->json(['res_type' => 'success', 'role' => 1, 'response' => 'Hello Admin, Login successfully !']);
    		}
    		else
    		{
    			return response()->json(['res_type' => 'error', 'response' => 'Login unsuccessfully !']);
    		}
    	}
    }

    public function logout()
    {
    	Auth::logout();
    	return redirect()->route('welcome');
    }
}
