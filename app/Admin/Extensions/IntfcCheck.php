<?php

namespace App\Admin\Extensions;

use Encore\Admin\Admin;

class IntfcCheck {
	
	protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    protected function script()
    {
        return <<<SCRIPT

	$('.fa-link').unbind('click').click(function () {
		var id = $(this).data('id')
		swal('已接入', '', 'success');
	});

SCRIPT;
    }

    protected function render()
    {
        Admin::script($this->script());

        return "<a class='btn btn-xs btn-primary fa fa-link' data-id='{$this->id}' style='margin-right:10px;'>接入检测</a>";
    }

    public function __toString()
    {
        return $this->render();
    }
}
