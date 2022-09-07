<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\LoanRegistered;
use App\Models\User;

class LoanEmi extends Model
{
    use HasFactory; 
    protected $table="loan_emi";
    public $timestamps =true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'loan_id',
        'user_id',
        'emi_ammount',
        'scheduled_repayment_date',
        'is_paid'
    ];

    public function loanDetails() 
    {
        return $this->hasOne('App\Models\LoanRegistered','id','loan_id');
    }

    public function userDetailsByEmi() 
    {
        return $this->hasOne('App\Models\User','id','user_id');
    }

    public function getCreatedAtAttribute($value)
    {
        return date("d-m-Y h:i A", strtotime($value));
    }

    public function getUpdatedAtAttribute($value)
    {
        return date("d-m-Y h:i A", strtotime($value));
    }

     public function getIsPaidAttribute($value)
    {        
         return  ($value == 1) ?  "PAID" : "PENDING";
    }
}
