<?php

namespace App\Admin\Controllers;

use Illuminate\Http\Request;
use Encore\Admin\Controllers\AuthController as BaseAuthController;
use App\Models\{AdminOperationLog, AdminUser};
use Illuminate\Support\Facades\Auth;

class AuthController extends BaseAuthController
{
	public function postLogin(Request $request)
    {
        $this->loginValidator($request->all())->validate();

        $credentials = $request->only([$this->username(), 'password']);
        $remember = $request->get('remember', false);

        if ($this->guard()->attempt($credentials, $remember)) {
			AdminOperationLog::create(['user_id' => Auth::id(), 'path' => 'login', 'method' => 'LOGIN', 'ip' => $_SERVER['REMOTE_ADDR']]);
            return $this->sendLoginResponse($request);
        }

        return back()->withInput()->withErrors([
            $this->username() => $this->getFailedLoginMessage(),
        ]);
    }

}
