<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\LoanRegistered;
use App\Models\LoanEmi;
use Exception;
use Auth;
use Validator;
use DB;
 use DateTime;
use Illuminate\Support\Facades\Hash;

class LoanController extends Controller
{
     /** 
     * Loan Request api 
     * Customer submit a loan request defining amount and term
     * @return \Illuminate\Http\Response 
     */
    public function loanRequest(Request $request)
    {    
        try {  
            $validator = Validator::make($request->all(), [
                'net_monthly_salary' => 'required',
                'loan_ammount' => 'required',
                'loan_term' => 'required',
                'repay_duration_type' => 'required'                
            ]);
            if ($validator->fails()) {
                return response()->json(['success' => false, 'result' => null, 'error' => $validator->errors()->first()], 200);
            }            
  
                $SaveLoanData = array(
                    'user_id' => Auth::user()->id,
                    'net_monthly_salary' => $request->net_monthly_salary,  
                    'loan_ammount' => $request->loan_ammount,       
                    'loan_term' => $request->loan_term, 
                    'repay_duration_type' => $request->repay_duration_type
                );            
                $loanData = LoanRegistered::create($SaveLoanData);               
                return response()->json(['success' => true, 'result' => $loanData, 'error' => null], 200);                
                  
        } catch (Exception $e) {
                    return response()->json(['success' => false, 'result' => null, 'error' => $e->getMessage()], 200);
        }
    }

    /** 
     * My Loan List api 
     * Add a policy check to make sure that the customers can view them own loan only.
     * @return \Illuminate\Http\Response 
     */
    public function LoanList(Request $request)
    {    
        try {                         
                $loans = LoanRegistered::where('user_id', Auth::user()->id)->orderBy('id', 'DESC')->with('emiList')->get();
                return response()->json(['success' => true, 'result' => $loans, 'error' => null], 200);                
                  
        } catch (Exception $e) {
                    return response()->json(['success' => false, 'result' => null, 'error' => $e->getMessage()], 200);
        }
    }

    /** 
     * Unapproved Loan List Request api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function unapprovedLoanRequestedList(Request $request)
    {    
        try {                         
                $loans = LoanRegistered::where('is_approved', 0)->orderBy('id', 'DESC')->get();               
                return response()->json(['success' => true, 'result' => $loans, 'error' => null], 200);                
                  
        } catch (Exception $e) {
                    return response()->json(['success' => false, 'result' => null, 'error' => $e->getMessage()], 200);
        }
    }

    /** 
     * Approved Loan List Request api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function approvedLoanRequestedList(Request $request)
    {    
        try {                         
                $loans = LoanRegistered::where('is_approved', 1)->orderBy('id', 'DESC')->get();               
                return response()->json(['success' => true, 'result' => $loans, 'error' => null], 200);                
                  
        } catch (Exception $e) {
                    return response()->json(['success' => false, 'result' => null, 'error' => $e->getMessage()], 200);
        }
    }

    /** 
     * Approve status of the Loan API 
     * Admin change the pending loans to state APPROVED
     * the loan and scheduled repayments will have state PENDING and insert in EMI
     * @return \Illuminate\Http\Response 
     */
    public function approveLoan(Request $request)
    {    
        try {    
           $validator = Validator::make($request->all(), [
                'loan_id' => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json(['success' => false, 'result' => null, 'error' => $validator->errors()->first()], 200);
            }  
            $loanData = LoanRegistered::find($request->loan_id);
            if($loanData->is_approved == 'APPROVED') {
               return response()->json(['success' => false, 'result' => null, 'error' => "Loan has already approved."], 200);
            } else {                
               // Insert EMIs
               $loan_emi_amount = $loanData->loan_ammount / $loanData->loan_term ; 
               $loan_emi = round($loan_emi_amount,2);
               if($loanData->repay_duration_type == 1 ){
                $duration = "week";
               } else if($loanData->repay_duration_type == 2 ){
                $duration = "month";
               } else if($loanData->repay_duration_type == 3 ){
                $duration = "year";
               }
               for($i=1; $i<=$loanData->loan_term; $i++) {
                $SaveEmiData = array(
                    'loan_id' => $request->loan_id, 
                    'user_id' => Auth::user()->id,                     
                    'emi_ammount' => $loan_emi,       
                    'scheduled_repayment_date' => date("Y-m-d", strtotime("+$i $duration"))
                );            
                 LoanEmi::create($SaveEmiData);
               }

               $loanData->is_approved = 1;
               $loanData->save();
               return response()->json(['success' => true, 'result' => $loanData, 'error' => null], 200);  
            } 
        } catch (Exception $e) {
                return response()->json(['success' => false, 'result' => null, 'error' => $e->getMessage()], 200);
        }
    }

    /** 
     * Repayment Loan api 
     * Customer add a repayment with amount greater or equal to the scheduled repayment
     * The scheduled repayment change the status to PAID
     * If all the scheduled repayments connected to a loan are PAID automatically also the loan become PAID
     * @return \Illuminate\Http\Response 
     */
    public function repayLoanEmi(Request $request)
    {    
        try {    
           $validator = Validator::make($request->all(), [
                'loan_id' => 'required',
                'ammount' => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json(['success' => false, 'result' => null, 'error' => $validator->errors()->first()], 200);
            }  
            $loanData = LoanRegistered::find($request->loan_id);
            if($loanData->status == 'PAID') {
               return response()->json(['success' => false, 'result' => null, 'error' => "You loan has already paid."], 200);
            } else if($loanData->is_approved == 'PENDING') {
               return response()->json(['success' => false, 'result' => null, 'error' => "Your loan was not approved. So you can not repayment."], 200);
            }  else { 

                $emiData = LoanEmi::where('loan_id',$request->loan_id)->where('user_id', Auth::user()->id)->where('is_paid',0)->orderBy('id')->first();

                if($emiData->emi_ammount > $request->ammount)
                {
                  return response()->json(['success' => false, 'result' => null, 'error' => "Repayment of amount should be greater or equal to the scheduled repayment."], 200);
                }

               $updateEmi = LoanEmi::find($emiData->id);
               $updateEmi->is_paid = 1;
               $updateEmi->save();

               $remainEmiCount = LoanEmi::where('loan_id',$request->loan_id)->where('user_id', Auth::user()->id)->where('is_paid',0)->count();
               if($remainEmiCount == 0) {
                 $loanData->status = 1;
                 $loanData->save();
               }
               return response()->json(['success' => true, 'result' => "Emi has paid successfully.", 'error' => null], 200);  
            } 
        } catch (Exception $e) {
                return response()->json(['success' => false, 'result' => null, 'error' => $e->getMessage()], 200);
        }
    }
}
