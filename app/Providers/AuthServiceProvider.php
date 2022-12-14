<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    /*public function boot()
    {
        $this->registerPolicies();

        //
    }*/
      public function boot()
    {
        $this->registerPolicies();

        Gate::define('isAdmin', function ($user) {
            return $user->role == 1;
        });
        /* define a manager user role */
        Gate::define('isManager', function ($user) {
            return $user->role == 3;
        });
        /* define a user role */
        Gate::define('isAgency', function ($user) {
            return $user->role == 4;
        });
        Gate::define('isUser', function ($user) {
            return $user->role == 2;
        });

        Passport::routes();
    }
}
