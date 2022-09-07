<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Exception;
use Auth;
use Validator;
use DB;
use Illuminate\Support\Facades\Hash;

class UsersignupController extends Controller
{
     /** 
     * Register api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function register(Request $request)
    { 
      try{  
        	$validator = Validator::make($request->all(), [
            	'first_name' => 'required',
                'email' => 'required|email',
                'password' => 'required',
                'mobile' => 'required',
                'date_of_birth' => 'required',
                'gender' => 'required',
                'about' => 'required',
                'city' => 'required',
                'device_token' => 'required'
            ]);
            if ($validator->fails()) {
                return response()->json(['success' => false, 'result' => null, 'error' => $validator->errors()->first()], 200);
            }            
            $userData = user::select('id')->where('email', $request->email)->first();           
            if ($userData) {
				return response()->json(['success' => false, 'result' => null, 'error' => 'Your account is already exists with this email. Please forgot your password.'], 200);	
            } else {
                $SaveUserData = array(
                    'first_name' => $request->first_name,  
                    'last_name' => $request->last_name,       
                    'email' => $request->email, 
                    'password' => Hash::make($request->password),               
                    'mobile' => $request->mobile, 
                    'date_of_birth' => $request->date_of_birth, 
                    'gender' => $request->gender, 
                    'about' => $request->about, 
                    'city' =>  $request->city,
                    'device_token' => $request->device_token,
                    'user_role' => 0,
                    'confirm_status' =>1,
                    'status' =>1,
                    'is_deleted' =>0,
                );            
                $userData = User::create($SaveUserData);               
                return response()->json(['success' => true, 'result' => $userData, 'error' => null], 200);                
            }        

    } catch (Exception $e) {
                return response()->json(['success' => false, 'result' => null, 'error' => $e->getMessage()], 200);
    }
 }

    /** 
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function login(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
            	'email' => 'required|email',
                'password' => 'required', 
                'is_admin' => 'required',  // 1 for admin, 0 for user

            ]);
            if ($validator->fails()) {
                return response()->json(['success' => false, 'result' => null, 'error' => $validator->errors()->first()], 200);
            }
            if (Auth::attempt(['email' => $request->email, 'password' => $request->password, 'user_role' => $request->is_admin])) {  
                
                $userData = Auth::user();
                if($userData->is_block == 1) {
                    return response()->json(['success' => false, 'result' => null, 'error' => 'Sorry! Your account has blocked. Please email us on support@anspire.com.'], 200);
                } else if($userData->status == 0) {
                    return response()->json(['success' => false, 'result' => null, 'error' => 'Sorry! Your account is inactive now. Please email us on support@anspire.com.'], 200);
                }
                DB::table('oauth_access_tokens')->where('user_id', Auth::user()->id)->delete(); 
                $data['auth_token'] =  $userData->createToken('MyApp')->accessToken;
                $data['user_id'] = Auth::user()->id;
                $data['first_name'] =  $userData->first_name;
                $data['last_name'] =  $userData->last_name;
                $data['email'] =  $userData->email;
                $data['mobile'] =  $userData->mobile;
                $data['date_of_birth'] =  $userData->date_of_birth;
                $data['gender'] =  $userData->gender;
                $data['about'] =  $userData->about;
                $data['city'] =  $userData->city;
                $data['device_token'] =  $userData->device_token;
                $data['user_role'] =  $userData->user_role;
                $data['confirm_status'] =  $userData->confirm_status;
                $data['status'] = $userData->status;
                return response()->json(['success' => true, 'result' => $data, 'error' => null], 200);
            }  else {
                return response()->json(['success' => false, 'result' => null, 'error' => 'Email or password is incorrect.'], 200);
            }

        } catch (Exception $e) {
            return response()->json(['success' => false, 'result' => null, 'error' => $e->getMessage()], 200);
        }
    }
}
