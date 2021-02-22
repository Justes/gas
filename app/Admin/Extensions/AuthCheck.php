<?php

namespace App\Admin\Extensions;

use Encore\Admin\Admin;

class AuthCheck {
	
	protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    protected function script()
    {
        return <<<SCRIPT

	$('.fa-ban').unbind('click').click(function () {
		var id = $(this).data('id')
		swal('已授权', '', 'success');
	});

SCRIPT;
    }

    protected function render()
    {
        Admin::script($this->script());

        return "<a class='btn btn-xs btn-primary fa fa-ban' data-id='{$this->id}' style='margin-right:10px;'>授权管理</a>";
    }

    public function __toString()
    {
        return $this->render();
    }
}
