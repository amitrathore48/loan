<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Auth;
use App\Models\LoanRegistered;
class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'password',
        'mobile',
        'date_of_birth',
        'user_role',
        'gender',
        'about',
        'city',
        'device_token',
        'remember_token',
        'is_block',
        'email_verified_at',
        'confirm_status',
        'status',
        'is_deleted',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];  

    public function userRegisteredLoan() 
    {
        return $this->hasMany('App\Models\LoanRegistered','user_id','id');
    }

}
