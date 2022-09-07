<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\LoanEmi;

class LoanRegistered extends Model
{
    use HasFactory; 
    protected $table="loan_registered";
    public $timestamps =true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'net_monthly_salary',
        'loan_ammount',
        'loan_term',
        'repay_duration_type',
        'emi_amount',
        'total_emi',
        'status',
        'is_approved',
        'is_deleted',
    ];

    public function userName() 
    {
        return $this->hasOne('App\Models\User','id','user_id');
    }

    public function emiList() 
    {
        return $this->hasMany('App\Models\LoanEmi','loan_id','id');
    }

    public function getStatusAttribute($value)
    {        
         return  ($value == 1) ?  "PAID" : "PENDING";
    }

    public function getIsApprovedAttribute($value)
    {        
         return  ($value == 1) ?  "APPROVED" : "PENDING";
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'is_deleted'
    ];

    public function getCreatedAtAttribute($value)
    {
        return date("d-m-Y h:i A", strtotime($value));
    }

    public function getUpdatedAtAttribute($value)
    {
        return date("d-m-Y h:i A", strtotime($value));
    }
}
