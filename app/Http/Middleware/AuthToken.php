<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\{AdminUser};

class AuthToken
{
    public function handle($request, Closure $next)
    {
		$token = $request->header('token');
		if(empty($token)) {
			return err(4001);
		}

		$user = AdminUser::where('token', $token)->first();
		if(empty($user)) {
			return err(4005);
		}

		return $next($request);
    }
}
