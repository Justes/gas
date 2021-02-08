<?php

namespace App\Admin\Extensions;

use Encore\Admin\Admin;

class CheckRow {
	
	protected $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    protected function script()
    {
        return <<<SCRIPT

	$('.fa-bolt').unbind('click').click(function () {
	var id = $(this).data('id')
			$.ajax({
				method: 'post',
				url: '/api/event/hurry',
				data: {
					event_id: id,
					_token:LA.token,
				},
				success: function (data) {
					$.pjax.reload('#pjax-container');

					if (typeof data === 'object') {
						if (data.status) {
							swal(data.msg, '', 'error');
						} else {
							swal(data.msg, '', 'success');
						}
					}
				},
				dataType:'json'
			});

});

SCRIPT;
    }

    protected function render()
    {
        Admin::script($this->script());

        return "<a class='btn btn-xs btn-primary fa fa-bolt' data-id='{$this->id}'>催办</a>";
    }

    public function __toString()
    {
        return $this->render();
    }
}
