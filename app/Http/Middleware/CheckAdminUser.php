<?php

namespace App\Http\Middleware;

use Closure;
use Auth;
use Illuminate\Http\Request;

class CheckAdminUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (Auth::user()->user_role != 1) {
             return response()->json(['success' => false, 'result' => null, 'error' => "This facility is only available for Admin user."], 200);
        }
        return $next($request);
    }
}
