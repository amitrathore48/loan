<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::namespace("Api")->group(function() {
	Route::post('register', 'UsersignupController@register');	
	Route::post('login', 'UsersignupController@login');	
	
	Route::group(['middleware' => 'auth:api'], function () {

	Route::get('my-loan-list', 'LoanController@LoanList');
	Route::put('repay-loan-emi', 'LoanController@repayLoanEmi');
	Route::post('loan-request', 'LoanController@loanRequest');

	// Admin APIs
	Route::group(['middleware' => 'checkadmin:api'], function () {			
		Route::get('unapproved-loan-requested-list', 'LoanController@unapprovedLoanRequestedList');
		Route::get('approved-loan-requested-list', 'LoanController@approvedLoanRequestedList');
		Route::put('approve-loan', 'LoanController@approveLoan');
	});
		
	});

});