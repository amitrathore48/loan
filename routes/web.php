<?php

use Illuminate\Support\Facades\Route;

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

/*Route::get('/', function () {
    return view('welcome');
});*/


Route::namespace("Site")->group(function() { 
    //landing page and some statics pages of fornt end side    
    Route::get('/', 'HomeController@index')->name('site.index');

});


 Route::group(['namespace' => 'Secureadmin','middleware' => 'authenticateCheckRole'], function() {

    //Admin Dashboard managements
	Route::match(['get', 'post'],'admin/', 'AdminController@index')->name('admin.login');
	Route::get('/admin/dashboard', 'DashboardController@dashboard')->name('admin.dashboard');
	Route::any('/admin/logout', 'DashboardController@logout')->name('admin.logout');  

	// User Profile controller
	Route::get('/admin/users', 'UserProfilesController@users')->name('admin.host.profiles');
	Route::any('/admin/update-profile-photos', 'UserProfilesController@updateProfilePhotos')->name('admin.update.profile.photos');
	

});